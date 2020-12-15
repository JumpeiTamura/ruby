require 'csv'

class MyAnotherCsvDestination
  attr_reader :output_file

  def initialize(output_file)
    @output_file = output_file
  end

  def write(row)
    return if row[:meta_source] != MyAnotherCsvSource

    @csv ||= CSV.open(output_file, 'w')
    unless @headers_written
      @headers_written = true
      @csv << row.headers
    end
    @csv << row.fields
  end

  def close
    @csv.close
  end
end
