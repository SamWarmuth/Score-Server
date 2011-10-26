class Score < CouchRest::Model::Base
  use_database "scoreserver_development"
  belongs_to :game
  
  belongs_to :team
  property :player_name, String
  belongs_to :player
  property :points, Integer
  
  timestamps!
end