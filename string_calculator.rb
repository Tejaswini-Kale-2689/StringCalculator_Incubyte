require "pry"
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ",|\n"
    if numbers.start_with?("//")
      delimiter, numbers = parse_delimiters(numbers)
    end

    number_array = numbers.split(/#{delimiter}/).map(&:to_i)

    negative_numbers = number_array.select { |num| num < 0 }
    raise "Negative numbers not allowed: #{negative_numbers.join(', ')}" unless negative_numbers.empty?

    number_array.reject { |num| num > 1000 }.sum
  end

  private

  def parse_delimiters(numbers)
    # Check for multiple or single custom delimiters within square brackets
    if numbers =~ %r{//(\[.+\])\n}
      # Capture all delimiters within brackets
      delimiters = numbers.scan(%r{\[(.+?)\]})
      # Flatten the array, escape special characters, and join with `|` for the regex
      delimiters_regex = delimiters.flatten.map { |delim| Regexp.escape(delim) }.join("|")
      # Extract the rest of the string after the newline character
      rest_of_string = numbers.split("\n", 2)[1]
      [delimiters_regex, rest_of_string]
    else
      # For single character delimiters (without brackets)
      delimiter = numbers[2]
      rest_of_string = numbers[4..]
      [Regexp.escape(delimiter), rest_of_string]
    end
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
puts calc.add("//[***]\n1***2***3")
puts calc.add("//[*][%]\n1*2%3")
