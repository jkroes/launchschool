require 'yaml'
DATA = YAML.load_file 'calculator.yml'
MESSAGES = DATA['messages']

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  /^-?\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^-?\d*\.\d*$/.match(input)
end

def number?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def operation_to_message(op)
  msg =
    case op
    when '1'
      "Adding"
    when '2'
      "Subtracting"
    when '3'
      "Multiplying"
    when '4'
      "Dividing"
    end

  return msg
end

prompt messages["welcome"]

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt messages["invalid_name"]
  else
    break
  end
end

prompt messages["greeting"] % { name: name }

loop do
  prompt messages["first_num"]

  number1 = ''
  loop do
    number1 = gets.chomp

    if integer? number1
      break
    else
      prompt messages["invalid_num"]
    end
  end

  prompt messages["second_num"]

  number2 = ''
  loop do
    number2 = gets.chomp

    if integer? number2
      break
    else
      prompt messages["invalid_num"]
    end
  end

  operator_prompt = <<~EOF
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  EOF

  prompt operator_prompt

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include? operator
      break
    else
      prompt messages["invalid_op"]
    end
  end

  prompt "#{operation_to_message operator} the two numbers..."

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt messages["result"] % { result: result }

  prompt messages["repeat_calc"]
  answer = gets.chomp
  break unless answer.downcase.start_with? "y"
end

prompt messages["goodbye"]
