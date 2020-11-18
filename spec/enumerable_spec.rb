include Enumerable
require_relative '../enumerable'

describe Enumerable do
    let (:arr_num) { [1,2,3,4,5] }
    let (:arr_with_false) { [1, 2, 3, 4, 5, nil]}
    let (:arr_string) { %w[this is a test string]}

    describe "#my_each" do
        it "returns enumerables if block is not given " do
            expect(arr_num.my_each).to be_kind_of(Enumerable)
        end

        it "returns each element of array" do
            expect(arr_num.my_each { |i| i } ).to eql(arr_num)
        end
    end

    describe "#my_each_with_index" do
        it "returns enumerables if block is not given" do
            expect(arr_num.my_each_with_index).to be_kind_of(Enumerable)
        end

        it 'returns each element with index of array' do
            expect(arr_num.my_each_with_index { |v, i| v }).to eql(arr_num)
        end
    end

    describe "#my_select" do
        it "returns enumerables if block is not given" do
            expect(arr_num.my_select).to be_kind_of(Enumerable)
        end

        it "returns new array" do
            new_arr = arr_num.select { |i| i.odd? }

            expect(arr_num.my_select { |i| i.odd?  }).to eql(new_arr)
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

            it 'fails the condition by any one element in array' do
                expect(arr_string.my_all? { |word| word.length >= 3 }).to eql(false)
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
end
