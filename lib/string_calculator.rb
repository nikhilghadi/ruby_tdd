class StringCalculator
  def add(numbers)
    numbers.strip!
    0 if numbers.empty?
    # using gusb to replace new line with comma with bang operator for changes in-place
    numbers.gsub!("\n",',')

    delimiter = getDelimeter(numbers)
    numbers.gsub!(delimiter,',')
    numbers = numbers.split(",").map(&:to_i)

    #validation for negative numbers
    validate_numbers(numbers)
   
    # initializing sum with 0 for inject method for of single number in string
    numbers.inject(0){|sum,number| sum + number}
  end

  def validate_numbers(numbers)
    negative_numbers =numbers.select{|n| n < 0}
    unless negative_numbers.empty?
      raise "negative numbers not allowed #{negative_numbers.join(', ')}"
    end
  end

  def getDelimeter(numbers)
    (numbers[0..1] == "//") ? numbers[2] : ","
  end
end