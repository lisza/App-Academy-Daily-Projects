class Employee
  attr_reader :salary, :employees

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    salaries = 0
    @employees.each do |employee|
      salaries += employee.salary
    end
    salaries * multiplier
  end

end

if __FILE__ == $PROGRAM_NAME
  shawna = Employee.new("Shawna", "TA", 12000, "Darren")
  david = Employee.new("David", "TA", 10000, "Darren")
  darren = Manager.new("Darren", "TA Manager", 78000, "Ned", [shawna, david])
  ned = Manager.new("Ned", "Founder", 1000000, boss = nil, [darren, shawna, david])

  p ned.bonus(5) # => 500_000
  p darren.bonus(4) # => 88_000
  p david.bonus(3) # => 30_000
end
