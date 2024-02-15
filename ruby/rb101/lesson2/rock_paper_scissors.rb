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

def display_results(player, computer)
  results =
    if win?(player, computer)
      'You win!'
    elsif win?(computer, player)
      'You lose!'
    else
      "It's a tie!"
    end
  prompt results
end

loop do
  choice = ''

  prompt "Choose one: #{VALID_CHOICES.join(', ')}"
  loop do
    choice = gets.chomp
    break if VALID_CHOICES.include? choice
    prompt "That's not a valid choice"
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose #{choice}. Computer chose #{computer_choice}"

  display_results(choice, computer_choice)

  prompt 'Do you want to play again? (y/n)'
  answer = gets.chomp
  p answer
  break unless answer.downcase.start_with? 'y'
end

prompt 'Thank you for playing!'
