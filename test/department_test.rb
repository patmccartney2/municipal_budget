require 'minitest/autorun'
require 'minitest/pride'
require './lib/department'

class DepartmentTest < Minitest::Test
  def test_it_exists
    department = Department.new("Parks and Recreation")

    assert_instance_of Department, department
  end

  def test_it_has_a_name
    department = Department.new("Parks and Recreation")

    assert_equal "Parks and Recreation", department.name
  end

  def test_it_has_expenses
    department = Department.new("Parks and Recreation")

    assert_equal [], department.expenses
  end
end
