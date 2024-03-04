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

def bust?(cards)
  total(cards) > 21
end

def blackjack?(cards)
  total(cards) == 21
end

def dealer_stay?(cards)
  total(cards) >= 17
end

def winner(human, computer)
  human_total = total(human)
  computer_total = total(computer)

  if human_total > computer_total
    'You won!'
  elsif human_total < computer_total
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

def prompt_dealer_total(cards)
  prompt "The value of the dealer's hand is #{total(cards)}"
end

def prompt_dealer(cards)
  prompt_dealer_cards(cards)
  prompt_dealer_total(cards)
end

def prompt_player_cards(cards)
  prompt "You hold #{join_hand(cards)}"
end

def prompt_player_total(cards)
  prompt "The value of your hand is #{total(cards)}"
end

def prompt_player(cards)
  prompt_player_cards(cards)
  prompt_player_total(cards)
end

def play_again?
  prompt "Would you like to play again? (y/n)"
  gets.chomp.downcase.start_with? "y"
end

loop do
  system 'clear'
  prompt "Welcome to blackjack."
  puts ""

  player = []
  dealer = []
  player_total = 0
  dealer_total = 0
  deck = initialize_deck

  2.times do
    deal!(deck, player)
    deal!(deck, dealer)
  end

  prompt "Player turn starts"
  prompt "The dealer holds #{join_hand(dealer[1])} and an unknown card"
  prompt_player_cards(player)

  loop do
    prompt_player_total(player)
    break if blackjack?(player)
    break if bust? player

    prompt "Do you want to h(it) or s(tay)?"

    hit_or_stay = gets.chomp.downcase
    if hit_or_stay.start_with? "h"
      prompt "Dealt %s" % deal!(deck, player)
    elsif hit_or_stay.start_with? "s"
      break
    else
      "Please select one of the two valid options"
    end
  end

  prompt "Player turn has concluded"
  puts ""

  if bust? player
    prompt "Comparing hands to determine the outcome of this game."
    prompt_player(player)
    prompt_dealer(dealer)
    puts ""
    prompt "You busted. The dealer wins!"
    puts ""
    play_again? ? next : break
  end

  prompt "Dealer turn starts"
  prompt_dealer_cards(dealer)

  loop do
    prompt_dealer_total(dealer)
    break if dealer_stay?(dealer)
    prompt "Dealt %s" % deal!(deck, dealer)
  end

  prompt "Dealer turn has concluded"
  puts ""

  if bust? dealer
    prompt "Comparing hands to determine the outcome of this game."
    prompt_player(player)
    prompt_dealer(dealer)
    puts ""
    prompt "The dealer busted. You win!"
    puts ""
    play_again? ? next : break
  end

  prompt "Comparing hands to determine the outcome of this game."
  prompt_player(player)
  prompt_dealer(dealer)
  puts ""
  prompt winner(player, dealer)
  puts ""
  play_again? ? next : break
end

prompt "Thank you for playing!"
