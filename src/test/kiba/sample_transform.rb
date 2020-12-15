class SampleTransform
  def process(row)
    row[:new_col] = row[:organization_id]
    row
  end
end
