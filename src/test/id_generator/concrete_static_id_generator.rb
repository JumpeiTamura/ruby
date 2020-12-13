require './id_generatable'

class ConcreteStaticIdGenerator
  include IdGeneratable::Static

  attr_reader :id

  def initialize(organization_id)
    @id = organization_id * 1000 + 1
  end
end
