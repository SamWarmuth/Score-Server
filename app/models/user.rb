class User < CouchRest::Model::Base
  use_database "scoreserver_development"
  
  property :device_id, String
  
  timestamps!
end