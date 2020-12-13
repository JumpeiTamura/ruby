class OddSupport < Support
  def resolve(trouble)
    trouble.number.odd?
  end
end
