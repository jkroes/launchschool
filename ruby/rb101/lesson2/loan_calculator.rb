#!/usr/bin/env ruby

def prompt(text)
  puts ">> #{text}"
end

def valid_dollars?(input)
  /^\$?\d{1,3}(,?\d{3})*(\.\d{1,2})*$/.match input
end

def dollars_to_f(input)
  input.sub(/[$,]/, '').to_f
end

def valid_percentage?(input)
  /^\d{1,3}(,?\d{3})*(\.\d{1,2})*%?$/.match input
end

def percent_to_f(input)
  input.sub(/[,%]/, '').to_f
end

def valid_months?(input)
  /^\d{1,3}(,?\d{3})*$/.match input
end

def months_to_i(input)
  input.sub(/[,]/, '').to_i
end

loop do
  prompt "Welcome to the loan calculator."

  principal =
    loop do
      prompt 'Please enter the loan amount in terms of US dollars:'
      dollars = gets.chomp
      break dollars_to_f(dollars) if valid_dollars?(dollars)
      prompt 'The value entered is invalid.'
    end

  monthly_rate =
    loop do
      prompt 'Please enter the annual percentage rate (APR) as a percentage:'
      apr = gets.chomp
      break (percent_to_f(apr) / 100 / 12) if valid_percentage?(apr)
      prompt 'The value entered is invalid.'
    end

  duration =
    loop do
      prompt 'Please enter the loan duration in terms of months:'
      months = gets.chomp
      break months_to_i(months) if valid_months?(months)
      prompt 'The value entered is invalid.'
    end

  monthly_payment =
    principal *
    (monthly_rate /
     (1 -
      ((1 + monthly_rate)**-duration)))

  prompt "Your monthly payment is #{monthly_payment}"

  prompt "Would you like to perform another calculation?"

  break unless gets.chomp.downcase.start_with? 'y'
end
