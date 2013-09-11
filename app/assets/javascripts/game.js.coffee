@GameCtrl = [ "$scope", ($scope) ->

  $scope.all_questions = new Array();
  $scope.correct_answers = new Array();
  $scope.user_answers = new Array();

  $scope.game = ($round) ->
    l = gon.creatures.length
    $scope.three_to_play = new Array()
    $scope.three_to_play.push(gon.creatures[Math.floor(Math.random() * l)]) for x in [0..2]
    nmb = Math.floor(Math.random() * 3)
    img = document.getElementById('guess_img').setAttribute 'src', $scope.three_to_play[nmb]['img_src']
    $scope.correct = $scope.three_to_play[nmb]['full_name']
    $scope.all_questions.push $scope.three_to_play
    $scope.all_questions[$round]['img'] = $scope.three_to_play[nmb]['img_src']
    $scope.correct_answers.push $scope.correct

  $scope.start = ->
    $scope.points = 0
    $scope.question = 1
    document.getElementById('start_game_button').setAttribute 'class', 'hidden'
    document.getElementById('play_game').setAttribute 'class', 'show'
    result = document.getElementById('result')
    result.setAttribute 'class', 'hidden'
    result.getElementsByTagName('span')[0].innerHTML = ""
    $scope.game(0)

  $scope.check = ->

    $scope.user_answers.push $scope.species
    if $scope.species is $scope.correct
      $scope.points++

    if $scope.question < 10
      $scope.question++
      $scope.game($scope.question-1)
    else
      $scope.show_result()

  $scope.show_result = ->
    document.getElementById('start_game_button').setAttribute 'class', 'show'
    document.getElementById('play_game').setAttribute 'class', 'hidden'
    result = document.getElementById('result')
    result.setAttribute 'class', 'show'
    result.getElementsByTagName('span')[0].innerHTML = "Result: You've gained "+$scope.points+"/10 points!"
    for elem, index in $scope.user_answers
      ul = document.getElementById(index)
      items = ul.getElementsByTagName('li')

      for li in items
        inner = li.innerHTML.replace /^\s+|\s+$/g, ""
        if inner is elem
          li.setAttribute 'class', 'wrong'
        if inner is $scope.correct_answers[index]
          li.setAttribute 'class', 'correct'

]