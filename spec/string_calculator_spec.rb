require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do 
  let(:calculator) { StringCalculator.new }
  context "Testing with empty string" do 
    it "should return 0 for empty string" do 
      expect(calculator.add("")).to eq(0)
    end

    it "should return 0 for string with black space" do 
      expect(calculator.add(" ")).to eq(0)
    end
  end

  context "Testing with 1 number" do
    it "should return 5 for 5" do
      expect(calculator.add("5")).to eq(5)
    end

    it "should return 10 for 10" do
      expect(calculator.add("10")).to eq(10)
    end
  end
  
  context "Testing with 2 numbers" do
    it "Should return 2 for 1, 1" do
      expect(calculator.add("1, 1")).to eq(2)
    end

    it "Should return 4 for 1, 3" do
      expect(calculator.add("3,1")).to eq(4)
    end
  end
  
  context "testing new line in string " do
    it "Should return 0 for \n" do
      expect(calculator.add("\n")).to eq(0)
    end

    it "Should return 6 for 1\n2,3" do 
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it "should return 8 for 1,3\n,2,\n1,1" do
      expect(calculator.add("1,3\n,2,\n1,1")).to eq(8)
    end
  end

  context "Testing with different delimiter" do
    it "should return 0 for //;\n" do 
      expect(calculator.add("//;\n")).to eq(0)
    end

    it "should return 3 for //;\n1;2" do 
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it "should return 6 for //*\n1*2*3" do 
      expect(calculator.add("//*\n1*2*3")).to eq(6)
    end
  end

  context "Adding validation for negative numbers" do
    it "should raise an exception for -1" do
      expect{calculator.add("-1")}.to  raise_error("negative numbers not allowed -1")
    end

    it "should raise an exception for -1,5,8, -2,7 -4" do
      expect{calculator.add("-1,5,8, -2,7\n-4")}.to  raise_error("negative numbers not allowed -1, -2, -4")
    end
  end
  
  context "Testing for some advance usecases" do 
    it "should return 79 for 1,6,8,3,6,9,14,12,2,19" do 
      expect(calculator.add("1,6,8,3,6,9,14,12,2,19")).to eq(80)
    end

    it "should return 79 for 1,6\n8,6,6,9\n14,2,2,19" do 
      expect(calculator.add(" 1,6\n8,6,6,9\n14,2,2,19")).to eq(73)
    end

    it "should return 79 for //^\n1^6\n8^6^6^9\n14^2^2^19" do 
      expect(calculator.add("//^\n1^6\n8^6^6^9\n14^2^2^19")).to eq(73)
    end
  end
end