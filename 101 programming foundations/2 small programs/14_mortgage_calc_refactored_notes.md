# Mortgage calculator #

Build a car payment calculator. You’ll need three pieces of information:
the loan amount
the annual percentage rate
the loan duration

From this information, using the given formula, you have to output the monthly payment to be given.

## Problem breakdown ##

Assumption - This is a calculator for estimating your EMI to give to bank.

Explicit requirements — get values for loan amount, annual rate and duration.

Implicit requirements — 
the loan amount can be in integers or floats
the annual rate is accepted as a percentage
The duration can be very specific: broken down into years, months and days.

Parse if a user enters a percent sign

Bonus - Map out how much is interest and how much is being returned in a typical monthly payment.

Bonus^2 - Suggest time period, EMI and Principal Amount based on users' budgets

## Data Stuctures ##

input:
loan amount: string, parse to float.
percentage: string, parse to float.
duration: hash with keys 'month' and 'year'

output: 
monthly loan amount: float

## Algorithm ##

m = p * (j / (1 - (1 + j)**(-n)))

>m = monthly payment [float]
p = loan amounts [float/integer]
j = monthly interest rate [float]
n = loan duration in months [integer]

This equation gives a value of Infinity when interest is 0%.

m = p / n
for calculating values for zero interest loans.