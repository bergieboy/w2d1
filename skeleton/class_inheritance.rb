class Employee

  attr_reader :salary, :salary, :title
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name, @title, @salary = name, title, salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?

    boss
  end

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees =[]
  end

  def add_employee(new_employee)
    employees << new_employee

    new_employee
  end

  def bonus(multiplier)
    total_employees_salary * multiplier
  end

  def total_employees_salary
    total_salary = 0
    self.employees.each do |employee|
      if employee.is_a?(Manager)
        total_salary += employee.salary + employee.total_employees_salary
      else
        total_salary += employee.salary
      end
    end
    total_salary
  end
end
