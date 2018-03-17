# calculate mortgage

# ask for: loan amount, annual percentage rate, loan duration.
# monthly interest; loan duration in months

# m = p * (j / (1 - (1 + j)**(-n)))

# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

puts "What's your loan amount?"
amount = gets.chomp.to_i

puts "What's the annual percentage rate?"
rate = gets.chomp.to_f

puts "What's the loan duration in years?"
duration = gets.chomp.to_i

monthly_rate = rate / 12
puts "Your monthly rate is #{monthly_rate}"

month_duration = duration * 12
puts "Your loan lasts #{month_duration} months"

monthly_payment =
                amount *
                ( (monthly_rate/100) / (1- (1+ (monthly_rate/100) )**(-month_duration) ) )

puts "Your monthly_payment is #{monthly_payment.round(2)}"
