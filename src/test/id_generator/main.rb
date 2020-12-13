require './id_generator_factory'

factory = IdGeneratorFactory.instance

organization_id = 5
serial_id_generator = factory.fetch(:serial, organization_id)
1000.times do
  puts serial_id_generator.next
end
