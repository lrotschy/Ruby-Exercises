# mortgage_calculator.rb
=begin
 need loan amount, APR, loan duration
 calculate monthly interest rate and loan duration in months
 formula: m = p * (j / (1 - (1 + j)**(-n)))
 m = monthly payment
 p = loan amount
 j = monthly interest rate
 n = loan duration in months
=end

def valid_integer?(input)
  Float(input) rescue false
end

def prompt(message)
  puts "  => #{message}"
end

def remove_commas(num_string)
  num_string = num_string.chars.delete_if { |x| x == ',' }
  new_num_string = ''
  num_string.each do |x|
    new_num_string << x
  end
  new_num_string
end

# START
# GET loan amount
prompt("Welcome to the payment calculator.")
loop do
  principle = ''
  loop do
    prompt("Please enter the amount of the principle")
    principle = gets.chomp
    principle = remove_commas(principle)
    # validate
    if valid_integer?(principle)
      break
    else
      prompt("You must enter a valid integer.")
    end
  end
  # convert to float
  # save as p
  p = principle.to_f
  # GET APR
  apr = ''
  loop do
    prompt("What is your APR?")
    apr = gets.chomp
    # remove commas
    # validate
    if valid_integer?(apr)
      break
    else
      prompt("You must enter a valid percent.")
    end
  end
    # convert to float
    # convert from percent to decimal by dividing by 100
    # convert to monthly interest rate
    # divide by 12
    # save as j
  j = (apr.to_f / 100) / 12

  # GET loan duration
  duration = ''
  loop do
    prompt("What is the duration of your loan in years?")
    duration = gets.chomp
    # validate

    if valid_integer?(duration)
      break
    else
      prompt("You must enter a valid number of years.")
    end
  end
  # convert to integer
  # convert to months
  # save as n
  n = duration.to_i * 12
  p n
  # Run formula
  # save m as result
  m = p * (j / (1 - (1 + j)**-n))

  # READ result
  prompt("With a principle of $#{principle}, an APR of #{apr}%:"
  prompt("your payment is $#{m.round(2)} for #{duration} years (#{n} months).")

  prompt("Would you like to make another calculation?"
  prompt("('y' for yes, 'n' for no)")
  answer = gets.chomp.downcase
  if answer == 'y'
    next
  else
    break
  end
end
prompt("Thank you for using the mortgage calculator. Goodbye.")
# END
=begin
# Solution provided by ls. Commas cause it to break.
def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  prompt("Welcome to Mortgage Calculator!")
  prompt("-------------------------------")

  prompt("What is the loan amount?")

  amount = ''
  loop do
    amount = Kernel.gets().chomp()

    if amount.empty?() || amount.to_f() < 0
      prompt("Must enter positive number.")
    else
      break
    end
  end

  prompt("What is the interest rate?")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

  interest_rate = ''
  loop do
    interest_rate = Kernel.gets().chomp()

    if interest_rate.empty?() || interest_rate.to_f() < 0
      prompt("Must enter positive number.")
    else
      break
    end
  end

  prompt("What is the loan duration (in years)?")

  years = ''
  loop do
    years = Kernel.gets().chomp()

    if years.empty?() || years.to_i() < 0
      prompt("Enter a valid number")
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i() * 12

  monthly_payment = amount.to_f() *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-months.to_i())))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")
# format is a kernel method used to remove decimals in this case.
  prompt("Another calculation?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")

=end
