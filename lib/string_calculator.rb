class StringCalculator
  def add(numbers)
    numbers.strip!
    0 if numbers.empty?
    # using gusb to replace new line with comma with bang operator for changes in-place
    numbers.gsub!("\n",',')

    delimiter = getDelimeter(numbers)
    numbers.gsub!(delimiter,',')

    # initializing sum with 0 for inject method for of single number in string
    numbers.split(",").inject(0){|sum,number| sum.to_i + number.to_i}
  end

  def getDelimeter(numbers)
    (numbers[0..1] == "//") ? numbers[2] : ","
  end
end