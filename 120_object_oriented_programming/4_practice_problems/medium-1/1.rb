class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

p BankAccount.new(1500).positive_balance?

# Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ before balance when you refer to the balance instance variable in the body of the positive_balance? method."

# "Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

# Who is right, Ben or Alyssa, and why?
# Ben is, because attr_reader gives you a chance to access it without the @.
# however, assignment can't happen to an instance variable without an @ or self, because ruby would prefer to assign to a local variable of the same name.