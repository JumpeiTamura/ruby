require './id_generatable'

class ConcreteSerialIdGenerator
  include IdGeneratable::Serial

  attr_reader :min_id, :max_id

  def initialize(organization_id)
    magnification = 1000
    @current_id = organization_id * magnification
    @min_id = @current_id + 1
    @max_id = @current_id + magnification - 1
  end

  private
  attr_accessor :current_id
end
