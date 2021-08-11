class Calculator
  attr_reader :total

  def initialize()
    @total = 0
  end

  def add(amount)
    @total += amount
  end
end
