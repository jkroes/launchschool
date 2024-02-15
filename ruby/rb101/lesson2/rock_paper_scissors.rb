#!/usr/bin/env ruby

VALID_CHOICES = %w(rock paper scissors lizard spock)

LOSES_TO = {
  "rock"     => %w(scissors lizard),
  "lizard"   => %w(paper    spock),
  "spock"    => %w(rock     scissors),
  "scissors" => %w(lizard   paper),
  "paper"    => %w(spock    rock)
}

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  if LOSES_TO[first].include? second
    true
  else
    false
  end
end

def results(player, computer)
  if win?(player, computer)
    'You win!'
  elsif win?(computer, player)
    'You lose!'
  else
    "It's a tie!"
  end
end

loop do
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
  prompt results(choice, computer_choice)
  prompt 'Do you want to play again? (y/n)'

  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt 'Thank you for playing!'
