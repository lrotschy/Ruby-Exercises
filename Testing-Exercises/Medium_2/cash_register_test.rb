require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"

Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

  def setup

  end

  def test_accept_money
    register = CashRegister.new(100)
    transaction = Transaction.new(10)
    transaction.amount_paid = 10
    register.accept_money(transaction)
    assert_equal(110, register.total_money)
  end

  def test_change
    register = CashRegister.new(100)
    transaction = Transaction.new(10)
    transaction.amount_paid = 20
    assert_equal(10, register.change(transaction))
  end

  def test_give_receipt
    register = CashRegister.new(100)
    transaction = Transaction.new(10)
    assert_output("You've paid $10.\n") {register.give_receipt(transaction)}
  end

  def test_prompt_for_payment
    transaction = Transaction.new(10)
    # input = StringIO.new('10\n')
    # output = StringIO.new
    transaction.prompt_for_payment(input: StringIO.new("10\n"), output: StringIO.new)

    assert_equal(10, transaction.amount_paid)
  end

end
