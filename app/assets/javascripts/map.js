////////////////// MARKER BUILDER FUNCTION ////////////

var createGameMarker = function (game, i) {
  game.marker = new google.maps.Marker({
    map: map,
    icon: '/assets/flags/flag_'+ i +'.png',
    draggable: false,
    animation: google.maps.Animation.DROP,
    position: {
      lat: game.lat,
      lng: game.lng
    }
  });

  var infoWindow = new google.maps.InfoWindow({
    content : '<div class="infoWindowContent">' +
      '<h2>' + game.name + '</h2>' +
      '<img src=' + game.picture + '>' +
      '<div class="infoWindowDesc">' +
      'Time: ' + game.time + '<br>' +
      'Description: ' + game.description + 
      '</div><input type="submit" value="Join Game" class="joinGameBtn" id="game_' + game.id + '"></div>'
  });

  var infoWindowClosed = true;
  // TODO: above can we get the button to disappear when the user has already joined the game and replace with JOINED! 

  game.marker.addListener("click", function (e) {
    console.log(lastInfoWindow)
      console.log(infoWindow)
      if (lastInfoWindow != null) {
        lastInfoWindow.close();
      }
    if (infoWindowClosed) {
      infoWindow.open(map, game.marker);
      infoWindowClosed = false;
    } else {
      infoWindow.close(map, game.marker);
      infoWindowClosed = true;
    }
    lastInfoWindow = infoWindow;
    var joinGame = $("#game_" + game.id);
    joinGame.on("click", function () {
      $.post('/user_games', {
        authenticity_token: csrf,
        user_game: {
          game_id: this.id.toString().substring(5, 999),
        }
      }).done(
        function (response) {
          console.log(response);
        });
    });
  });
};

//////////////////// MY MAP ///////////////////////

var map;
function initMap() {
  var lastSelectedGame = null;
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 51.38806611676009, lng: -0.100250244140625},
    minZoom: 3,
    zoom: 8,
    styles: [{"featureType":"all","elementType":"labels.text.fill","stylers":[{"color":"#ffffff"},{"weight":"0.20"},{"lightness":"28"},{"saturation":"23"},{"visibility":"off"}]},{"featureType":"all","elementType":"labels.text.stroke","stylers":[{"color":"#494949"},{"lightness":13},{"visibility":"off"}]},{"featureType":"all","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#144b53"},{"lightness":14},{"weight":1.4}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#08304b"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#0c4152"},{"lightness":5}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#0b434f"},{"lightness":25}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},{"featureType":"road.arterial","elementType":"geometry.stroke","stylers":[{"color":"#0b3d51"},{"lightness":16}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"}]},{"featureType":"transit","elementType":"all","stylers":[{"color":"#146474"}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#021019"}]}]

  });

  // Loose marker we place when a click happens
  marker = new google.maps.Marker({
    map: map,
    draggable: false,
    animation: google.maps.Animation.DROP
  });

  map.addListener('click', function (e) {
    // Go fill in the input type=hidden
    marker.setVisible(true);
    $("#game_lat").val(e.latLng.lat());
    $("#game_lng").val(e.latLng.lng());
    marker.setPosition(e.latLng);
  });

    var allGames = [pastGames, upcomingGames, myPastGames, myUpcomingGames];
  for (var i = 0; i < allGames.length; ++i) {
    allGames[i].forEach(function (game) {
      createGameMarker(game, i);
    })
  }
}

