require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:pudding) { Dessert.new("pudding",50,chef) }
  let(:chef) { double("chef", :titleize => "chef", :bake => 500) }
  let(:cake) { Dessert.new("lie","50",chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(pudding.type).to eq("pudding")
    end

    it "sets a quantity" do
      expect(pudding.quantity).to be(50)
    end
    it "starts ingredients as an empty array" do
      expect(pudding.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect{cake}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      pudding.add_ingredient("sugar")
      expect(pudding.ingredients).to include("sugar")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(pudding.ingredients).to receive(:shuffle!)
      pudding.mix!
    end
  end

  describe "#eat" do
    before (:each) do
      @pud = Dessert.new("pudding",50,chef)
    end
    it "subtracts an amount from the quantity" do
      expect(@pud.quantity).to be(50)
      @pud.eat(5)
      expect(@pud.quantity).to be(45)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect(@pud.quantity).to be(50)
      expect{@pud.eat(51)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      @pud = Dessert.new("pudding",50,chef)
      expect(@pud.serve).to include("chef")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      @pud = Dessert.new("pudding",50,chef)
      expect(chef).to receive(:bake).with(@pud)
      @pud.make_more
    end
  end
end
