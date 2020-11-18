include Enumerable
require_relative '../enumerable'

describe Enumerable do
    describe "#my_each" do
        let (:arr) { [1,2,3,4,5] }

        it "returns enumerables if block is not given " do
            expect(arr.my_each).to be_kind_of(Enumerable)
        end

        it "returns block if block given" do
            expect(arr.my_each { |i| i } ).to eql(arr) 
        end


    end
end