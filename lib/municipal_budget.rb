require './lib/department'
require './lib/budget_category'
require './lib/expense'

class MunicipalBudget

  attr_reader :expenses

  def initialize
    @expenses = []
  end

  def add_expense(expense)
    @expenses << expense
  end

  def departments
    array = []
    @expenses.each do |expense|
      array << expense.department
    end
    return array
  end

  def budget_categories
    array = []
    @expenses.each do |expense|
      array << expense.budget_category
    end
    return array
  end

  def total_expenses
    array = []
    @expenses.each do |expense|
      array << expense.amount.to_f
    end
    return array.sum
  end

  def alphabetical_budget_categories
    array = []
    @expenses.each do |expense|
      array << expense.budget_category.name
    end
    return array.sort
  end
  


end
