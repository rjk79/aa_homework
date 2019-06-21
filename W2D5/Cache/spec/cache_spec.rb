require "cache"
require "rspec"
#study order and scope
describe LRUCache do #needs to match case
    subject(:lrucache) {LRUCache.new(3)}

    describe "#initialize" do
        it "sets a size" do
            expect(lrucache.cache.size).to eq(3)
        end
    end

    describe "#add" do
        context "element already exists"
            it "adds a new element" do
                lrucache.add([1, 2, 3, 4])
                lrucache.add(:ring_of_fire)
                lrucache.add("I walk the line")
                count = lrucache.count
                lrucache.add(:ring_of_fire)
                expect(lrucache.count).to eq(count)
            end
            it "does not remove any element" do
                lrucache.add([1, 2, 3, 4])
                lrucache.add(:ring_of_fire)
                lrucache.add("I walk the line")
                count = lrucache.count
                lrucache.add(:ring_of_fire)
                expect(lrucache.cache.size).to eq(3)
            end
    end


end