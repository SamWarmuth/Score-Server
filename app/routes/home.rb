class Main
  get "/" do
    scores = [{:home_team => {:name => "Brookfield Bruisers"}, :away_team => {:name => "Vernon RFC"}, :date => "11/4"}]
    return scores.to_json
  end
  get "/css/style.css" do
    content_type 'text/css', :charset => 'utf-8'
    sass :style
  end
end
