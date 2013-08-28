@GameCtrl = [ "$scope", ($scope) ->
  $scope.start = ->
    l = gon.creatures.length
    $scope.three_to_play = new Array()
    $scope.three_to_play.push(gon.creatures[Math.floor(Math.random() * l)]) for x in [0..2]
    document.getElementById('start_game_button').setAttribute 'class', 'hidden'
    document.getElementById('play_game').setAttribute 'class', 'show'
    $scope.correct = Math.floor(Math.random() * 3)
    img = document.getElementById('guess_img').setAttribute 'src', $scope.three_to_play[$scope.correct]['img_src']

  $scope.check = ->
    # ej = $scope.guess.name
    # console.log(ej)
    console.log($scope.guess)
]