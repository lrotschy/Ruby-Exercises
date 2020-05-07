# calculator_refactor.rb
LANGUAGE = 'zh'
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts("=>#{message}")
end

def valid_number?(input)
  input == 0 || input.to_f.nonzero?
end

=begin
#other options for checking
def valid_number? num
    num.to_i.to_s == num || num.to_f.to_s == num
end

def valid_number?(num)
  if input == 0 || input.to_i.nonzero?
end

def number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  Integer(input) rescue false
end

def float?(input)
  Float(input) rescue false
end

def integer?(input)
  /^\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^\d*\.?d*$/.match(input)
end

=end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt('welcome')
name = ''

loop do
  name = gets.chomp
  if name.empty?
    prompt('valid_name')
  else
    break
  end
end

prompt('hi')

loop do
  number1 = ''
  loop do
    prompt('get_number')
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt('valid_number')
    end
  end

  prompt('ok')
  number2 = ''

  loop do
    prompt('get_number')
    number2 = Kernel.gets.chomp
    if valid_number?(number2)
      break
    else
      prompt('valid_number')
    end
  end
=begin
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
=end
  prompt('operator_prompt')
  operator = ''

  loop do
    operator = Kernel.gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('valid_number')
    end
  end

  result =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  # prompt("#{operation_to_message(operator)} #{number1} and # {number2}...")

  puts "The result is #{result}"

  puts("Do you want to perform another calculation? ('Y' to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt('thank_you')
