require 'csv'

class MyCsvSource
  attr_reader :input_file

  def initialize(input_file)
    @input_file = input_file
  end

  def each
    CSV.open(input_file, headers: true, header_converters: :symbol) do |csv|
      csv.each do |row|
        row[:meta_source] = self.class
        yield(row)
      end
    end
  end
end
