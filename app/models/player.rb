class Player < CouchRest::Model::Base
  use_database "scoreserver_development"
  
  property :name, String
  belongs_to :team
  
  timestamps!
end