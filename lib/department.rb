class Department

  attr_reader :name,
              :expenses

  def initialize(name)
    @expenses = []
    @name = name
  end

end
