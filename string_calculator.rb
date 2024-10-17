class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    number_array = numbers.split(",").map(&:to_i)
    number_array.sum
  end
end


calc = StringCalculator.new
puts calc.add("")
puts calc.add("2")
puts calc.add("2,4")
puts calc.add("2,4,6")
