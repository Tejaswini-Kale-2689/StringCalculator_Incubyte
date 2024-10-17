require "pry"
class StringCalculator
  # Public method to add numbers from the string
  def add(input)
    return 0 if input.empty?

    delimiters, numbers = parse_input(input)
    number_list = extract_numbers(numbers, delimiters)

    validate_no_negatives(number_list)

    sum_of_numbers(number_list)
  end

  private

  # Method to parse the input and extract delimiters and number string
  def parse_input(input)
    if custom_delimiter?(input)
      parse_custom_delimiters(input)
    else
      [",|\n", input] # Default delimiters: comma or newline
    end
  end

  # Check if the input starts with a custom delimiter
  def custom_delimiter?(input)
    input.start_with?("//")
  end

  # Method to extract custom delimiters and the number string
  def parse_custom_delimiters(input)
    if input =~ %r{//(\[.+?\])+\n} # Matches custom delimiters enclosed in brackets
      delimiters = input.scan(%r{\[(.+?)\]}).flatten
      delimiters_regex = delimiters.map { |d| Regexp.escape(d) }.join("|")
      numbers = input.split("\n", 2).last
      [delimiters_regex, numbers]
    else
      single_delimiter = Regexp.escape(input[2])
      numbers = input[4..]
      [single_delimiter, numbers]
    end
  end

  # Method to extract and convert the numbers from the string
  def extract_numbers(numbers, delimiters)
    numbers.split(/#{delimiters}/).map(&:to_i)
  end

  # Method to validate and raise error for negative numbers
  def validate_no_negatives(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
  end

  # Method to sum the numbers, ignoring those greater than 1000
  def sum_of_numbers(numbers)
    numbers.reject { |num| num > 1000 }.sum
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
