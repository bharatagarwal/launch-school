require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def integer? string
  Integer(string) rescue false
end

def float? string
  # string.to_f.to_s == input edge case of 1. & 1.0
  Float(string) rescue false
end

def number? number
  numbers = number.split('')
  
  point_counter = 0

  numbers.each do |n|
    if integer?(n)
      next
    elsif n == '.' && point_counter == 0
      point_counter += 1 
    else
      return false
    end
  end
  
  true
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_integer?(number)

  number == number.to_i().to_s
  # however, 00 won't be accepted this way.

  # /^\d+$/.match(number)
  # ^ means start of string
  # \d means digits
  # + means one or more of preceding matcher
  # $ means end of string
  # .inspect reveals MatchData(number) when there's a match, otherwise nil.

  # Kernel.Integer(number) rescue false
  # Integer converts to integer
  # If input is invalid, it returns TypeError;
  # hence use of rescue to give a false return

end

def operation_to_message(op)
  result =  case op
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end

  # Add code here
  result
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(messages('valid_name'))
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['en']['first_num'])
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(MESSAGES['en']['invalid_num'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['en']['second_num'])
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(MESSAGES['en']['invalid_num'])
    end
  end

  prompt(MESSAGES['en']['operator'])

  operator = ''

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['en']['choose_correct'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_f() / number2.to_f()
            end

  prompt("The result is #{result}")

  prompt(MESSAGES['en']['continue'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['en']['thanks'])
