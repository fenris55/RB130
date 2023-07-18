require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!

require_relative "cash_register"
require_relative "transaction"

class CashRegisterTest < Minitest::Test
  # def setup
  #   @cash_register = CashRegister.new(0)
  #   @buy_milk = Transaction.new(4)
  # end

  # 1.2
  #note: this test passes
  #however, lesson soltuion doesn't rely on other custom methods for testng (like #prompt for payment)
  #instead, it sues the attr_accessor to directly change @amount paid, and then check that the
  # correct amount has been subtracted from CashRegister @total_money. Commenting out my test
  # and typing out lesson solution below: 

  # lesson also sets up the objects directly in the test, rather than defining a setup method
  # because it works at the method level, solution uses method local variables rather than instance
  # variables

  # def test_accept_money
  #   @buy_milk.prompt_for_payment
  #   @cash_register.accept_money(@buy_milk)
  #   assert_equal(4, @cash_register.total_money)
  # end

  #lesson solution: 

  # def test_accept_money
  #   register = CashRegister.new(1000)
  #   transaction = Transaction.new(20)
  #   transaction.amount_paid = 20 #changing Tranactions@amount_paid using attr_accessor

  #   previous_amount = register.total_money #confirming original register amount in CashRegister@total_money
  #   register.accept_money(transaction) #target method for test
  #   current_amount = register.total_money # cnfirming that CashRegister@total_money was incremented

  #   assert_equal previous_amount + 20, current_amount # test; again not using parentheses
  # end

  # 1.3
  # def test_change
  #   # only testing #test_change, not the other connected methods
  #   # setting cahs register amount to 1000, item price to 20, and amount paid to 50
  #   # checking that #test_change returns 30 in change (50 - 20)
  #   register = CashRegister.new(1000)
  #   transaction = Transaction.new(20) #item price
  #   transaction.amount_paid = 50 #manually adding amount paid

  #   assert_equal 30, register.change(transaction) # checking for correct change amount (50 - 20)
  # end

  #1.4
  # note: lesson solution omits testing the return value
  # def test_give_receipt
  #   register = CashRegister.new(1000)
  #   transaction = Transaction.new(13)

  #   assert_output("You've paid $13.\n") { register.give_receipt(transaction) } #method output contains newline
  #   assert_nil register.give_receipt(transaction) # verifying nil return value
  # end
end