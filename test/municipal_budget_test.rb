require 'minitest/autorun'
require 'minitest/pride'
require './lib/municipal_budget'
require './lib/department'
require './lib/budget_category'
require './lib/expense'

class MunicipalBudgetTest < Minitest::Test

  def test_it_exists
    m = MunicipalBudget.new
    assert_instance_of MunicipalBudget, m
  end

  def test_attributes
    m = MunicipalBudget.new
    assert_equal [], m.expenses
  end

  def test_it_can_hold_expenses
    m = MunicipalBudget.new
    m.add_expense("expense")
    assert_equal "expense", m.expenses[0]
    assert_equal 1, m.expenses.count
    m.add_expense("expense_2")
    assert_equal "expense_2", m.expenses[1]
    assert_equal 2, m.expenses.count
  end

  def test_it_works_with_pieces
    municipal_budget = MunicipalBudget.new
    department = Department.new("Parks and Recreation")
    budget_category = BudgetCategory.new("Appliances")
    expense_1 = Expense.new(department, budget_category, "656.50")
    municipal_budget.add_expense(expense_1)
    expense_2 = Expense.new(department, budget_category, "20.45")
    municipal_budget.add_expense(expense_2)
    assert_equal 2, municipal_budget.expenses.count
  end

  def test_can_call_departments
    municipal_budget = MunicipalBudget.new
    department = Department.new("Parks and Recreation")
    budget_category = BudgetCategory.new("Appliances")
    expense_1 = Expense.new(department, budget_category, "656.50")
    municipal_budget.add_expense(expense_1)
    expense_2 = Expense.new(department, budget_category, "20.45")
    municipal_budget.add_expense(expense_2)
    assert_equal [department, department], municipal_budget.departments
    assert_equal [budget_category, budget_category], municipal_budget.budget_categories
  end

  def test_it_can_add_expenses
    municipal_budget = MunicipalBudget.new
    department = Department.new("Parks and Recreation")
    budget_category = BudgetCategory.new("Appliances")
    expense_1 = Expense.new(department, budget_category, "656.50")
    municipal_budget.add_expense(expense_1)
    expense_2 = Expense.new(department, budget_category, "20.45")
    municipal_budget.add_expense(expense_2)
    assert_equal 676.95, municipal_budget.total_expenses
  end

  def test_alphabetical_budget_categories
    municipal_budget = MunicipalBudget.new
    department = Department.new("Parks and Recreation")
    budget_category = BudgetCategory.new("Appliances")
    budget_category_2 = BudgetCategory.new("Payroll")
    budget_category_3 = BudgetCategory.new("Alcohol")
    expense_1 = Expense.new(department, budget_category, "656.50")
    municipal_budget.add_expense(expense_1)
    expense_2 = Expense.new(department, budget_category_2, "20.45")
    municipal_budget.add_expense(expense_2)
    expense_3 = Expense.new(department, budget_category_3, "20.45")
    municipal_budget.add_expense(expense_3)
    assert_equal ["Alcohol", "Appliances", "Payroll"], municipal_budget.alphabetical_budget_categories
  end


end
