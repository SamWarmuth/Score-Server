class Sport < CouchRest::Model::Base
  use_database "scoreserver_development"
  
  property :name, String
  
  property :active, TrueClass, :default => true
  timestamps!
end