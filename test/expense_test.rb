require 'minitest/autorun'
require 'minitest/pride'
require './lib/expense'

class ExpenseTest < Minitest::Test

  def test_it_exists
    expense = Expense.new("Parks","appliances", "656.50")
    assert_instance_of Expense, expense
  end

  def test_attributes
    expense = Expense.new("Parks","appliances", "656.50")
    assert_equal "Parks", expense.department
    assert_equal "appliances", expense.budget_category
    assert_equal "656.50", expense.amount
  end

end
