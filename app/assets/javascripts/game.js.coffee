@GameCtrl = [ "$scope", ($scope) ->
  $scope.start = ->
    l = gon.creatures.length
    $scope.three_to_play = new Array()
    $scope.three_to_play.push(gon.creatures[Math.floor(Math.random() * l)]) for x in [0..2]
    document.getElementById('play_game').setAttribute 'class', 'show'
    document.getElementById('start_game_button').setAttribute 'class', 'hidden'
  $scope.check = ->
    # ej = $scope.guess.name
    # console.log(ej)
    console.log($scope.guess)
]