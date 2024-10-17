class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ",|\n"
    if numbers.start_with?("//")
      delimiter, numbers = parse_delimiter(numbers)
    end

    number_array = numbers.split(/#{delimiter}/).map(&:to_i)
    number_array.sum
  end

  private

  def parse_delimiter(numbers)
    delimiter, rest = numbers.match(%r{//(.+)\n(.*)}).captures
    [delimiter, rest]
  end
end


calc = StringCalculator.new
puts calc.add("")
puts calc.add("2")
puts calc.add("2,4")
puts calc.add("2,4,6")
puts calc.add("2,4\n6")
puts calc.add("//;\n1;2")
