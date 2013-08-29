@GameCtrl = [ "$scope", ($scope) ->

  $scope.game = ->
    l = gon.creatures.length
    $scope.three_to_play = new Array()
    $scope.three_to_play.push(gon.creatures[Math.floor(Math.random() * l)]) for x in [0..2]
    nmb = Math.floor(Math.random() * 3)
    img = document.getElementById('guess_img').setAttribute 'src', $scope.three_to_play[nmb]['img_src']
    $scope.correct = $scope.three_to_play[nmb]['full_name']

  $scope.start = ->
    $scope.points = 0
    $scope.question = 1
    document.getElementById('start_game_button').setAttribute 'class', 'hidden'
    document.getElementById('play_game').setAttribute 'class', 'show'
    document.getElementById('result').innerHTML = ""
    $scope.game()

  $scope.check = ->

    if $scope.species is $scope.correct
      $scope.points++

    if $scope.question < 10
      $scope.question++
      $scope.game()
    else
      document.getElementById('start_game_button').setAttribute 'class', 'show'
      document.getElementById('play_game').setAttribute 'class', 'hidden'
      document.getElementById('result').innerHTML = "You've gained "+$scope.points+"/10 points"
]