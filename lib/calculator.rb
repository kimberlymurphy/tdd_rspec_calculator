
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

  def multiply(number)
    @number *= number
    return self
  end

  def divide(number)
    @number /= number
    return self
  end

  def sqrt(number)
    @number = Math.sqrt(number)
    return self
  end
end
