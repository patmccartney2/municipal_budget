

class Expense

  attr_reader :department,
              :budget_category,
              :amount

  def initialize(d, bc, amount)
    @department = d
    @budget_category = bc
    @amount = amount
  end

end
