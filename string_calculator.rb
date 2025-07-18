class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      custom_delim = Regexp.escape(header[2])
      delimiter = /#{custom_delim}/
    end

    nums = numbers.split(delimiter).map(&:to_i)

    negatives = nums.select { |n| n < 0 }
    raise "Negatives not allowed: #{negatives.join(',')}" if negatives.any?

    nums.select{|n| n <= 1000 }.sum
  end
end
