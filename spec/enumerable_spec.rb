include Enumerable
require_relative '../enumerable'

describe Enumerable do
    let (:arr_num) { [1,2,3,4,5] }

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
end
