Mortgage calculator

Build a car payment calculator. You’ll need three pieces of information:
the loan amount
the annual percentage rate
the loan duration

From this information, using the given formula, you have to output the monthly payment to be given.

__Factors you’ll be evaluated on__
Program Operation: ability to handle standard conditions and unusual input.
Data Validation
User Interface
Rubocop
Source code: notes and issues
Source code: readability

__Problem breakdown__

Assumption - This is a calculator for estimating your EMI to give to bank.

Explicit requirements — get values for loan amount, annual rate and duration.

Implicit requirements — 
the loan amount can be in integers or floats
the annual rate is accepted as a percentage
The duration can be very specific: broken down into years, months and days.

if annual rate is between 0 and 1, check if they understand that this is probably a wrong input.

Parse if a user enters a percent sign

Bonus - Map out how much is interest and how much is being returned in a typical monthly payment.

Bonus^2 - Loan amount and target EMI, and estimated time period; i can afford this much emi, how much time will it take?

Two options, and send to bank the one you like.

EMI and target time period, and estimate amount; which car can i afford based on time and emi amount.

Two options, and send to bank the one you like.

__Examples/Test Cases__
write a method that gives you a value like this:

compute_monthly_payment(loan_amount, percent_rate, duration)

compute_monthly_payment(-55_000, 13%, 5 and a half years)
compute_monthly_payment(100_000.55, 13.50,5 years 6 months)
compute_monthly_payment(100_000.55, 13.50,5 years and 6 months)
compute_monthly_payment(0, (14,5), 5.5 years)
compute_monthly_payment(100_000, 0, 5.5 years)
compute_monthly_payment(100_000, 13, 0)
compute_monthly_payment(100_000, 5, 5.5 yrs)
compute_monthly_payment(100_000, .5, 5 YRS)
compute_monthly_payment(100_000a, .5, 5 YRS)
compute_monthly_payment(100_000a, five, 5 YRS)
compute_monthly_payment(100_000a, five, 5)
compute_monthly_payment(100_000a, .5, 5 YRS)
compute_monthly_payment(100_000a, five, 5 YRS)
compute_monthly_payment(100_000a, five, 5)

methods for the following:

valid_amount?
valid_rate?
valid_duration?

__Data Structures__
input:
loan amount: string, convert to float or integer.
percent: float
duration: string, and then parse;
or different variables for y/m/d and accept integer.

output: monthly loan amount: float, with float loan repayment and interest amounts.

__Algorith__

m = p * (j / (1 - (1 + j)**(-n)))

>m = monthly payment [float]
p = loan amounts [float/integer]
j = monthly interest rate [float]
n = loan duration in months [integer]
