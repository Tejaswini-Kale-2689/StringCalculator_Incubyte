require './string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'when input is an empty string' do
      it 'returns 0' do
        expect(calculator.add("")).to eq(0)
      end
    end

    context 'when input contains a single number' do
      it 'returns the number' do
        expect(calculator.add("1")).to eq(1)
      end
    end

    context 'when input contains two numbers separated by a comma' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("1,2")).to eq(3)
      end
    end

    context 'when input contains more than two numbers or unlimitted nembers separated by a comma' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("1,2,6,7")).to eq(16)
      end
    end

    context 'when input contains newlines as delimiters' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when input contains a custom delimiters' do
      it 'returns the sum of the numbers using the custom delimiter' do
        expect(calculator.add("//;\n1;2")).to eq(3)
        expect(calculator.add("//;\n4;6;8")).to eq(18)
      end
    end

    context 'when input contains negative numbers' do
      it 'raises an exception with the message "Negative numbers not allowed"' do
        expect { calculator.add("1,-2,3") }.to raise_error("Negative numbers not allowed: -2")
      end

      it 'raises an exception listing all negative numbers' do
        expect { calculator.add("1,-2,-3,4") }.to raise_error("Negative numbers not allowed: -2, -3")
      end
    end

    context 'when input contains numbers larger than 1000' do
      it 'ignores numbers larger than 1000' do
        expect(calculator.add("2,1001,6")).to eq(8)
        expect(calculator.add("1001,2000,3")).to eq(3)
      end
    end
    
  end
end
