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

    context 'when input contains more than two numbers separated by a comma' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("1,2,6,7")).to eq(16)
      end
    end

    context 'when input contains newlines as delimiters' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end
  end
end
