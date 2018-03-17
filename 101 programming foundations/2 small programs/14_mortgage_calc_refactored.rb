def prompt(message)
  Kernel.puts("=> #{message}")
end

def float?(num)
  #coercing value to reflect true nature of method
  !!(Float(num) rescue false)
end

def integer?(num)
  #coercing value to reflect true nature of method
  !!(Integer(num) rescue false)
end

def compute_monthly_payment(loan_amount, annual_interest_rate, duration)
  loan_amount = Float(loan_amount)
  monthly_interest_rate = Float(annual_interest_rate)/12
  month_duration = Integer(duration[:years])*12 + Integer(duration[:months])

  details = {}
  # adapted formula to allow for zero-interest calculations
  details[:monthly_payment] = if monthly_interest_rate == 0
                                  loan_amount/month_duration
                              else
                                  loan_amount *
                                  ( (monthly_interest_rate/100) / 
                                    (1- (1+ (monthly_interest_rate/100) )**(-month_duration) ) )
                    end

  details[:monthly_principal] = loan_amount/month_duration
  details[:monthly_interest_paid] = details[:monthly_payment] - details[:monthly_principal]
  details[:total_paid] = details[:monthly_payment]*month_duration
  details[:total_interest] = details[:total_paid] - loan_amount

  details
end

loop do
  prompt("Welcome to the Car Loan Calculator!")
  
  loan_amount = ''
  loop do
    prompt("What's the loan amount?")
    loan_amount = Kernel.gets().chomp()
    # checking for amount being greater than zero, v/s being equal to or greater than zero for interest rate.
    if float?(loan_amount)
      if Float(loan_amount)>0
        break
      else
        prompt("Sorry! Please enter a valid number.")
      end  
    else 
      prompt("Sorry! Please enter a valid number.")
    end
  end

  annual_interest_rate = ''
  loop do
    prompt("What's the annual interest rate? Enter 5.4 for 5.4%")
    annual_interest_rate = Kernel.gets.chomp()
    if float?(annual_interest_rate)
      if Float(annual_interest_rate) >= 0
        break
      else
        prompt("Sorry! Please enter a valid number greater than or equal to zero.")
      end
    elsif annual_interest_rate.match(/\%/)
    # parsing for when user enters % sign with interest rate
      annual_interest_rate.chomp!('%')
      if float?(annual_interest_rate) && Float(annual_interest_rate)>=0
        break
      end
    else
      prompt("Sorry! Please enter a valid number greater than or equal to zero.")
    end
  end

  duration = {}
  loop do
    prompt("What's the duration of the loan? (in years)")
    duration[:years] = Kernel.gets().chomp()
    if integer?(duration[:years])
      if Integer(duration[:years]) > 0
        break
      else
      prompt("Sorry! Please enter a valid positive integer.")
      end
    else
      prompt("Sorry! Please enter a valid positive integer.")
    end
  end

  loop do
    prompt("What's the duration of the loan? (in months)")
    duration[:months] = Kernel.gets().chomp()
    if integer?(duration[:months])
      if (0..12).include?(Integer(duration[:months]))
        break
      else
        prompt("Sorry! Please enter a valid integer between 0 and 12.")
      end  
    else
      prompt("Sorry! Please enter a valid integer between 0 and 12.")
    end
  end

  details = compute_monthly_payment(loan_amount,annual_interest_rate, duration)
  prompt("Your monthly payment is #{details[:monthly_payment].round(2)}")
  prompt("Your monthly interest is #{details[:monthly_interest_paid].round(2)}")
  prompt("Your monthly principal paid is #{details[:monthly_principal].round(2)}")
  prompt("You pay #{details[:total_paid].round(2)} over a period of #{duration[:months]}.")
  prompt("Your total interest paid is #{details[:total_interest].round(2)}")


  prompt("Do you want to do another calculation? (Y/N)")
  continue = Kernel.gets().chomp()
  break if continue.downcase.start_with?('n')
end
