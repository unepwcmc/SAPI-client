@GameCtrl = [ "$scope", ($scope) ->
  $scope.start = ->
    l = gon.creatures.length
    $scope.three_to_play = new Array()
    $scope.three_to_play.push(gon.creatures[Math.floor(Math.random() * l)]) for x in [0..2]
    document.getElementById('start_game_button').setAttribute 'class', 'hidden'
    document.getElementById('play_game').setAttribute 'class', 'show'
    document.getElementById('result').innerHTML = ""
    nmb = Math.floor(Math.random() * 3)
    img = document.getElementById('guess_img').setAttribute 'src', $scope.three_to_play[nmb]['img_src']
    $scope.correct = $scope.three_to_play[nmb]['full_name']

  $scope.check = ->
    document.getElementById('start_game_button').setAttribute 'class', 'show'
    document.getElementById('play_game').setAttribute 'class', 'hidden'
    if $scope.species is $scope.correct
      document.getElementById('result').innerHTML = "well done"
    else
      document.getElementById('result').innerHTML = "fail, it was " + $scope.correct
]