module IdGeneratable
  def next
    not_implemented
  end

  private

  def not_implemented
    raise NotImplementedError
  end

  class IdNumberingError < StandardError; end

  module Static
    include IdGeneratable

    def id
      not_implemented
    end

    def next
      id
    end
  end

  module Serial
    include IdGeneratable

    [:min_id, :max_id].each{ |method| define_method(method){ not_implemented } }

    def next
      (self.current_id += 1).tap do
        raise IdNumberingError, '採番できる最大値をオーバーしています' if current_id > max_id
      end
    end

    private
    def current_id
      not_implemented
    end

    def current_id=(id)
      not_implemented
    end
  end
end
