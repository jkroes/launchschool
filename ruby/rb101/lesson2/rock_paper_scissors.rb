#!/usr/bin/env ruby

VALID_CHOICES = %w(rock paper scissors lizard spock)

LOSES_TO = {
  "rock" => %w(scissors lizard),
  "lizard" => %w(paper spock),
  "spock" => %w(rock scissors),
  "scissors" => %w(lizard paper),
  "paper" => %w(spock rock)
}

RESULTS_MSGS = [
  'You win this round!',
  'You lose this round!',
  "This round is a tie!"
]

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  LOSES_TO[first].include? second
end

def results(player, computer)
  if win?(player, computer)
    0
  elsif win?(computer, player)
    1
  else
    2
  end
end

loop do
  prompt 'Beginning a match of rock, paper, scissors, lizard, spock'
  prompt 'The match will end when one party reaches three wins'

  player_wins = 0
  computer_wins = 0

  until player_wins == 3 || computer_wins == 3
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"

    choice =
      loop do
        input = gets.chomp

        choices = VALID_CHOICES.select do |vc|
          vc.start_with? input
        end

        break choices[0] if choices.size == 1

        prompt "That's not a valid choice"
      end

    computer_choice = VALID_CHOICES.sample

    prompt "You chose #{choice}. Computer chose #{computer_choice}"

    results_code = results(choice, computer_choice)

    prompt RESULTS_MSGS[results_code]

    case results_code
    when 0 then player_wins += 1
    when 1 then computer_wins += 1
    end
  end

  if player_wins == 3
    prompt 'You won the match!'
  else
    prompt 'The computer won the match!'
  end

  prompt 'Do you want to play again? (y/n)'

  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt 'Thank you for playing!'
