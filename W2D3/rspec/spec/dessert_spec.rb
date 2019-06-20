require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) {Dessert.new('cupcake', 5, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('cupcake') #expect its type to not be nil
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(5) #expect its type to not be nil
    end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new('strawberry', '3', chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient('flour')
      expect(dessert.ingredients).to include('flour')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient('flour')
      dessert.add_ingredient('sprinkles')
      dessert.add_ingredient('frosting')
      dessert.add_ingredient('paper')
      old_array = dessert.ingredients[0..-1]
      dessert.mix!
      expect(dessert.ingredients).not_to eq(old_array)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(2)
      expect(dessert.quantity).to eq(3)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(7)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize) {"Chef Gusto the Great Baker"}
      expect(dessert.serve).to include("Chef Gusto the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake) {dessert.heat!}
      dessert.make_more
      expect(dessert.temp).to eq(400)
    end
  end
end
