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
Explicit requirements — get values for loan amount, annual rate and duration.
Implicit requirements — the loan amount can be in integers or floats, the annual rate is accepted as a percentage, and the duration can be very specific (maybe a factor of time?)

That you are the person taking the loan, and not the bank.

__Examples/Test Cases__
compute_monthly_payment(loan_amount, percent_rate, duration)

compute_monthly_payment(-55_000, 13%, 5 and a half years)
compute_monthly_payment(100,000.55, 13.50,5 years 6 months)
compute_monthly_payment(0, (14,5), 5.5 years)