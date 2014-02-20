
class Calculator
  def initialize
    @number = 0
  end

  def total
    @number
  end

  def add(number)
    @number += number
    return self
  end

  def subtract(number)
    @number -= number
    return self
  end

end
