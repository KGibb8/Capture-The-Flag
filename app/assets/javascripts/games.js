

///////////////////// GAMES FOR THE MAP /////////////////////

var pastGames = [<% @past_games.each do |game| %>
<%= "{id: #{game.id}, lat: #{game.lat}, lng: #{game.lng}, name: #{game.name.inspect}, picture: '#{game.pictures[0].thumb.url unless game.pictures[0].nil?}', time: '#{game.start_time.inspect}', description: #{game.description.inspect}},".html_safe %>
<% end %>];

var upcomingGames = [<% @upcoming_games.each do |game| %>
<%= "{id: #{game.id}, lat: #{game.lat}, lng: #{game.lng}, name: #{game.name.inspect}, picture: '#{game.pictures[0].thumb.url unless game.pictures[0].nil?}', time: '#{game.start_time.inspect}', description: #{game.description.inspect}},".html_safe %>
  <% end %>];

  var myPastGames = [];
  var myUpcomingGames = [];

  <% unless current_user.nil? %>
    var myPastGames = [<% @my_past_games.each do |game| %>
    <%= "{id: #{game.id}, lat: #{game.lat}, lng: #{game.lng}, name: #{game.name.inspect}, picture: '#{game.pictures[0].thumb.url unless game.pictures[0].nil?}', time: '#{game.start_time.inspect}', description: #{game.description.inspect}},".html_safe %>
  <% end %>];

  var myUpcomingGames = [<% @my_upcoming_games.each do |game| %>
  <%= "{id: #{game.id}, lat: #{game.lat}, lng: #{game.lng}, name: #{game.name.inspect}, picture: '#{game.pictures[0].thumb.url unless game.pictures[0].nil?}', time: '#{game.start_time.inspect}', description: #{game.description.inspect}},".html_safe %>
<% end %>];
<% end %>




