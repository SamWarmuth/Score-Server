class Main
  get "/games" do
    scores = [{:home_team => {:name => "Brookfield Bruisers", :score => "0"},
        :away_team => {:name => "DSHA RFC", :score => '80'}, :date => "11/1", :status => "Final"},
      {:home_team => {:name => "Brookfield Bruisers", :score => "17"},
        :away_team => {:name => "Kettle Moraine", :score => '60'}, :date => "11/1", :status => "Final"},
      {:home_team => {:name => "Brookfield Bruisers", :score => "14"},
        :away_team => {:name => "Vernon RFC", :score => '0'}, :date => "11/4", :status => "First Half"}]
    return Game.all.map{|g| g.pretty}.to_json
  end
  post "/games/new" do
    game = Game.new
    game.home_team = Team.get(params[:home_team_id])
    game.away_team = Team.get(params[:away_team_id])
    game.date = Time.now
    
    game.save
    return "Game Created Successfully."
  end
  get "/sports/by-category" do
    Sport.all.find_all do |s|
       s.gender == params[:gender]
       s.age == params[:age]
    end.to_json
  end
  post "/sports/new" do
    @sport = Sport.new
    @sport.name = params[:sport_name]
    @sport.save
    return @sport.to_json
  end
  get "/teams/by-sport/:sport_id" do
    Team.all.find_all{|t| t.sport_id == params[:sport_id]}.to_json
  end
  post "/teams/new" do
    @team = Team.new
    @team.name = "Brookfield Bruisers"
    @team.save
    return @team.to_json
  end
  get "/css/style.css" do
    content_type 'text/css', :charset => 'utf-8'
    sass :style
  end
end
