require './my_csv_source'
require './my_another_csv_source'
require './sample_transform'
require './my_csv_destination'
require './my_another_csv_destination'

module SyncJob
  module_function

  def setup
    Kiba.parse do
      source ::MyCsvSource, './organizations.csv'
      source ::MyAnotherCsvSource, './organization_codes.csv'
      transform ::SampleTransform
      destination ::MyCsvDestination, './test.csv'
      destination ::MyAnotherCsvDestination, './test2.csv'
    end
  end
end
