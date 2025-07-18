class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      custom_delim = Regexp.escape(header[2])
      delimiter = /#{custom_delim}/
    end

    numbers.split(delimiter).map(&:to_i).sum
  end
end
