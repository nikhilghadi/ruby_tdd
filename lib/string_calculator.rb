class StringCalculator
  def add(numbers)
    numbers.strip!
    0 if numbers.empty?
    # initializing sum with 0 for inject method for of single number in string
    numbers.split(",").inject(0){|sum,number| sum.to_i + number.to_i}
  end
end