class Game < CouchRest::Model::Base
  use_database "scoreserver_development"
  property :home_team_id, String
  property :away_team_id, String
  property :user_id, String
  
  property :date, Time
  property :status, :default => "upcoming"
  
  property :active, TrueClass, :default => true
  timestamps!
  
  def home_team
    Team.get(self.home_team_id)
  end
  def away_team
    Team.get(self.away_team_id)
  end
  def user
    Team.get(self.user_id)
  end
  
  def pretty
    scores = self.score
    return {:home_team => {:name => self.home_team.name, :score => scores[0].to_s},
      :away_team => {:name => self.away_team.name, :score => scores[1].to_s}, :date => self.date, :status => self.status}
  end
  def score
    combined = Score.all.find_all{|s| s.game_id == self.id}
    home_scores = combined.find_all{|s| s.game_id == self.home_team_id}
    away_scores = combined.find_all{|s| s.game_id == self.home_team_id}
    home_number = home_scores.inject(0){|sum, s| sum + s.points}
    away_number = away_scores.inject(0){|sum, s| sum + s.points}
    return [home_number, away_number]
    
  end
end