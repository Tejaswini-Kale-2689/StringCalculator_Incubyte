class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ",|\n"
    if numbers.start_with?("//")
      delimiter, numbers = parse_delimiter(numbers)
    end

    number_array = numbers.split(/#{delimiter}/).map(&:to_i)

    negative_numbers = number_array.select { |num| num < 0 }
    raise "Negative numbers not allowed: #{negative_numbers.join(', ')}" unless negative_numbers.empty?

    number_array.reject { |num| num > 1000 }.sum
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
#puts calc.add("-1;-2")
puts calc.add("2,7,1002,3000")
