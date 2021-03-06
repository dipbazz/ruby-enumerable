require_relative '../enumerable'

describe Enumerable do
  let(:arr_num) { [1, 2, 3, 4, 5] }
  let(:arr_with_false) { [1, 2, 3, 4, 5, nil, true] }
  let(:arr_string) { %w[this is a test string] }

  describe '#my_each' do
    it 'returns enumerables if block is not given ' do
      expect(arr_num.my_each).to be_kind_of(Enumerable)
    end

    it 'returns each element of array' do
      expect(arr_num.my_each { |i| i }).to eql(arr_num)
    end
  end

  describe '#my_each_with_index' do
    it 'returns enumerables if block is not given' do
      expect(arr_num.my_each_with_index).to be_kind_of(Enumerable)
    end

    it 'returns each element with index of array' do
      expect(arr_num.my_each_with_index { |v, _i| v }).to eql(arr_num)
    end
  end

  describe '#my_select' do
    it 'returns enumerables if block is not given' do
      expect(arr_num.my_select).to be_kind_of(Enumerable)
    end

    it 'returns new array' do
      new_arr = arr_num.select(&:odd?)

      expect(arr_num.my_select(&:odd?)).to eql(new_arr)
    end
  end

  describe '#my_all?' do
    context 'when its falsey' do
      it 'has false value in array' do
        expect(arr_with_false.my_all?).to eql(false)
      end

      it 'has no false value in array' do
        expect(arr_num.my_all?).not_to eql(false)
      end

      it 'fails condition by one element in array' do
        expect(arr_string.my_all? { |word| word.length >= 3 }).to eql(false)
      end

      it 'fails regular expression by any one element' do
        expect(arr_string.my_all?(/t/)).to eql(false)
      end

      it 'fails any element to be numeric value' do
        expect(arr_string.my_all?(Numeric)).to eql(false)
      end
    end

    context 'when its truthy' do
      it 'satisfies condition by every element in array' do
        expect(arr_string.my_all? { |word| word.length >= 1 }).to eql(true)
      end

      it 'is an empty array' do
        expect([].my_all?).to eql(true)
      end
    end
  end

  describe '#my_any?' do
    context "When it's Truthy" do
      it 'has any one of the element is true' do
        expect(arr_string.my_any? { |i| i.length >= 3 }).to eql(true)
      end

      it 'has any one of the element is satisfy the condition' do
        expect(arr_string.my_any? { |i| i.length >= 6 }).to eql(true)
      end

      it 'has any one of the element is Numeric ' do
        expect(arr_with_false.my_any?(Integer)).to eql(true)
      end

      it 'has any truthy element ' do
        expect(arr_with_false.my_any?).to eql(true)
      end
    end

    context "When it's a falsey" do
      it 'it does not match with regular expression' do
        expect(arr_string.my_any?(/d/)).to eql(false)
      end

      it 'it is an empty array' do
        expect([].my_any?).to eql(false)
      end
    end
  end

  describe '#my_none?' do
    context 'when its truthy' do
      it 'has all false value in array' do
        expect([nil, false].my_none?).to eql(true)
      end

      it 'has one true value in array' do
        expect(arr_num.my_none?(String)).to eql(true)
      end

      it 'has all false value with condition' do
        expect(arr_string.my_none? { |word| word.length >= 7 }).to eql(true)
      end

      it 'fails to match regular expression' do
        expect(arr_string.my_none?(/d/)).to eql(true)
      end

      it 'has empty array' do
        expect([].my_none?).to eql(true)
      end
    end

    context 'when its falsey' do
      it 'has any one truthy value' do
        expect(arr_string.my_none? { |word| word.length >= 1 }).to eql(false)
      end

      it 'is has any one truthy value' do
        expect(arr_with_false.my_none?).to eql(false)
      end

      it 'matches one element with regular expression' do
        expect(arr_string.my_none?(/a/)).to eql(false)
      end
    end
  end

  describe '#my_count' do
    it 'returns the size of an array' do
      expect(arr_num.my_count).to eql(arr_num.count)
    end

    it 'returns size of argument' do
      expect(arr_num.my_count(2)).to eql(arr_num.count(2))
    end

    it 'returns the value based on given block condition' do
      expect(arr_num.my_count(&:even?)).to eql(arr_num.count(&:even?))
    end
  end

  describe '#my_map' do
    it 'returns block if proc is not given' do
      expect(arr_num.my_map { |i| i * 2 }).to eql(arr_num.map { |i| i * 2 })
    end

    it 'returns Enumerable if proc and block both are not given' do
      expect(arr_num.my_map).to be_kind_of(Enumerable)
    end

    it 'returns proc if proc given' do
      my_proc = proc { |i| i * 2 }
      expect(arr_num.my_map(my_proc)).to eql([2, 4, 6, 8, 10])
    end
  end

  describe '#my_inject' do
    it 'returns the sum of element from enumerator' do
      expect(arr_num.my_inject(:+)).to eql(arr_num.inject(:+))
    end

    it 'returns the sum of element from enumerator' do
      expect(arr_num.my_inject('+')).to eql(arr_num.inject(:+))
    end

    it 'returns the product of element from enumerator' do
      expect(arr_num.my_inject(3, :*)).to eql(arr_num.inject(3, :*))
    end

    it 'returns the result after calculation from given block and argument' do
      expect(arr_num.my_inject(2) { |product, i| product * i }).to eql(arr_num.inject(2) { |product, i| product * i })
    end

    it 'returns the result after calculation from given block' do
      expect(arr_num.my_inject { |sum, i| sum + i }).to eql(arr_num.inject { |sum, i| sum + i })
    end

    it 'returns the longest value in array' do
      expect(arr_string.my_inject { |x, y| x.length > y.length ? x : y }).to eql('string')
    end

    it 'raises LocalJumpError if no block given' do
      expect { arr_num.my_inject }.to raise_error(LocalJumpError)
    end

    it 'raises ArgumentError if wrong number of argument given' do
      expect { arr_num.my_inject(1, 2, 3) }.to raise_error(ArgumentError)
    end
  end
end
