class Main
  get "/" do
    scores = [{:home_team => {:name => "Brookfield Bruisers", :score => 14},
      :away_team => {:name => "Vernon RFC", :score => 0}, :date => "11/4"}]
    return scores.to_json
  end
  get "/css/style.css" do
    content_type 'text/css', :charset => 'utf-8'
    sass :style
  end
end
