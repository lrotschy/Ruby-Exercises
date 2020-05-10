# Debugging_7.rb

class BankAccount
  attr_accessor :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if valid_withdrawal?(amount)
      self.balance -= amount
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def valid_withdrawal?(amount)
    new_balance = balance - amount
    amount > 0 && new_balance >= 0
  end

  # def balance=(new_balance)
  #   if valid_transaction?(new_balance)
  #     @balance = new_balance
  # end
  #
  # def valid_transaction?(new_balance)
  #   new_balance > 0
  # end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
p account.balance         # => 50


class What
  def name=(name)

    name.downcase!

    @name = name
    return "Returned at the very beginning."
  end
end

person = What.new
p person.name = 'BOB' # => 'BOB'
