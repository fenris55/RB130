require "minitest/autorun"
# require "minitest/reporters"
# Minitest::Reporters.use!

require_relative "transaction"

class TransactionTest < Minitest::Test
  #1.6 and #1.7
  def test_prompt_for_payment
    transaction = Transaction.new(15)
    input = StringIO.new("30\n")
    output = StringIO.new
    # assert_equal 30, transaction.prompt_for_payment(input: input)
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end 
end