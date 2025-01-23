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
end