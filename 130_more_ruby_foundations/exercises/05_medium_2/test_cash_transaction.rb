require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

# By minitest convention, 
# we'll be naming this class 
# "Class name we want to test" Test

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(400)
    @transaction.amount_paid = 520
  end

  def test_accept_money
    @register.accept_money(@transaction)
    assert_equal @register.total_money, 1000 + @transaction.amount_paid
  end

  def test_change
    difference_in_amount = @transaction.amount_paid - @transaction.item_cost
    change = @register.change(@transaction)
    assert_equal change, difference_in_amount
  end

  def test_give_receipt
    item_cost = 35
    transaction = Transaction.new(item_cost)
    
    # puts appends a newline to the message that is output.
    assert_output("You've paid $#{item_cost}.\n") do
      @register.give_receipt(transaction)
    end

    # first comes expected, then comes actual.
  end
end

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end
end