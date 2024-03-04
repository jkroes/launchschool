#!/usr/bin/env ruby

FACE_CARDS = ['Jack', 'Queen', 'King']
RANKS = ['Ace', *2..10, *FACE_CARDS]
SUITS = ['Hearts', 'Clubs', 'Spades', 'Diamonds']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  ranks = RANKS * 4
  suits = SUITS.map { |suit| [suit] * 13 }
  ranks.zip suits.flatten
end

def rank(card)
  card[0]
end

def suit(card)
  card[1]
end

def select_suit(cards, card_suit)
  cards.select { |card| suit(card) == card_suit }
end

def deal!(cards, hand)
  card = cards.delete(cards.sample)
  hand.append(card)
  card
end

# rubocop:disable Lint/ElseLayout
def initial_value(rank)
  if rank.is_a? Integer then rank
  elsif FACE_CARDS.include? rank then 10
  else 11
  end
end
# rubocop:enable Lint/ElseLayout

def ace_values(values)
  ace_idx = values.rindex(11)
  if values.sum > 21 && ace_idx
    values[ace_idx] = 1
    ace_values(values)
  end
  values
end

def total(cards)
  values = cards.map { |card| initial_value(rank(card)) }
  ace_values(values).sum
end

def bust?(total)
  total > 21
end

def blackjack?(total)
  total == 21
end

def dealer_stay?(total)
  total >= 17
end

def determine_result!(human_total, computer_total, score)
  if bust? human_total
    score[:dealer] += 1
    :player_busted
  elsif bust? computer_total
    score[:player] += 1
    :dealer_busted
  elsif human_total > computer_total
    score[:player] += 1
    :player_won
  elsif human_total < computer_total
    score[:dealer] += 1
    :dealer_won
  else
    :tie
  end
end

def result_msg(result)
  case result
  when :player_busted
    "You busted. The dealer wins!"
  when :dealer_busted
    "The dealer busted. You win!"
  when :player_won
    'You won!'
  when :dealer_won
    'The dealer won!'
  else
    "It's a tie!"
  end
end

def join_hand(cards)
  unless cards[0].is_a? Array
    cards = [cards]
  end

  # NOTE join is unexpectedly recursive
  cards = cards.map { |card| card.join(' of ') }

  case cards.size
  when 0 then ''
  when 1 then cards[0]
  when 2 then "#{cards[0]} and #{cards[1]}"
  else
    cards[-1] = "and #{cards.last}"
    cards.join(', ')
  end
end

def prompt_dealer_cards(cards)
  prompt "The dealer holds #{join_hand(cards)}."
end

def prompt_dealer_total(total)
  prompt "The value of the dealer's hand is #{total}"
end

def prompt_dealer(cards, total)
  prompt_dealer_cards(cards)
  prompt_dealer_total(total)
end

def prompt_player_cards(cards)
  prompt "You hold #{join_hand(cards)}"
end

def prompt_player_total(total)
  prompt "The value of your hand is #{total}"
end

def prompt_player(cards, total)
  prompt_player_cards(cards)
  prompt_player_total(total)
end

def play_again?
  prompt "Would you like to play again? (y/n)"
  gets.chomp.downcase.start_with? "y"
end

def display_results(human, computer, human_total, computer_total, score)
  prompt "Comparing hands to determine the outcome of this game."
  prompt_player(human, human_total)
  prompt_dealer(computer, computer_total)
  puts ""
  puts "=" * 40
  result = determine_result!(human_total, computer_total, score)
  prompt result_msg(result)
  puts "=" * 40
  puts ""
end

loop do
  system 'clear'
  prompt "Welcome to blackjack"
  prompt "Let's play a match"
  prompt "First to five wins the match"
  puts ""

  wins = {player: 0, dealer: 0}

  loop do
    player = []
    dealer = []
    player_total = 0
    dealer_total = 0
    deck = initialize_deck

    2.times do
      deal!(deck, player)
      deal!(deck, dealer)
    end

    player_total = total(player)
    dealer_total = total(dealer)

    prompt "The current score is Player: #{wins[:player]}, Dealer: #{wins[:dealer]}"
    puts ""
    prompt "Player turn starts"
    prompt "The dealer holds #{join_hand(dealer[1])} and an unknown card"
    prompt_player_cards(player)

    loop do
      prompt_player_total(player_total)
      break if blackjack?(player_total)
      break if bust? player_total

      prompt "Do you want to h(it) or s(tay)?"

      hit_or_stay = gets.chomp.downcase
      if hit_or_stay.start_with? "h"
        prompt "Dealt %s" % deal!(deck, player)
        player_total = total(player)
      elsif hit_or_stay.start_with? "s"
        break
      else
        "Please select one of the two valid options"
      end
    end

    prompt "Player turn has concluded"
    puts ""

    if bust? player_total
      display_results(player, dealer, player_total, dealer_total, wins)
      wins.values.any? { |score| score == 5 } ? break : next
    end

    prompt "Dealer turn starts"
    prompt_dealer_cards(dealer)

    loop do
      prompt_dealer_total(dealer_total)
      break if dealer_stay?(dealer_total)
      prompt "Dealt %s" % deal!(deck, dealer)
      dealer_total = total(dealer)
    end

    prompt "Dealer turn has concluded"
    puts ""

    if bust? dealer_total
      display_results(player, dealer, player_total, dealer_total, wins)
      wins.values.any? { |score| score == 5 } ? break : next
    end

    display_results(player, dealer, player_total, dealer_total, wins)
    break if wins.values.any? { |score| score == 5 }
  end

  if wins[:player] == 5
    prompt "You won the match!"
  else
    prompt "The dealer won the match!"
  end

  play_again? ? next : break
end

prompt "Thank you for playing!"



# Bonus Feature 2: The last call to play_again? differs from
# earlier ones in that it doesn't use the ternary option to
# choose between enxt and break. Because it is the last line of
# the outer loop, the outer loop will repeat immediately without
# a call to next.
