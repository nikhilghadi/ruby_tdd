require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do 
  context "Testing with empty string" do 
    it "should return 0 for empty string" do 
      calculator = StringCalculator.new
      expect(calculator.add("")).to eq(0)
    end

    it "should return 0 for string with black space" do 
      calculator = StringCalculator.new
      expect(calculator.add(" ")).to eq(0)
    end
  end

  context "Testing with 1 number" do
    it "should return 5 for 5" do
      calculator = StringCalculator.new
      expect(calculator.add("5")).to eq(5)
    end

    it "should return 10 for 10" do
      calculator = StringCalculator.new
      expect(calculator.add("10")).to eq(10)
    end
  end
  
  context "Testing with 2 numbers" do
    it "Should return 2 for 1, 1" do
      calculator = StringCalculator.new
      expect(calculator.add("1, 1")).to eq(2)
    end

    it "Should return 4 for 1, 3" do
      calculator = StringCalculator.new
      expect(calculator.add("3,1")).to eq(4)
    end
  end
  
end