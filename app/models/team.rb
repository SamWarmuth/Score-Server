class Team < CouchRest::Model::Base
  use_database "scoreserver_development"
  
  property :name, String
  property :gender, String, :default => "male"
  property :age, String, :default => "youth"
  belongs_to :sport
  collection_of :players, Player
  collection_of :scores, Score
  
  timestamps!
end