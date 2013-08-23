@SpeciesCtrl = ["$scope", ($scope) ->
  include = (arr, obj) ->
    i = 0

    while i < arr.length
      return true  if arr[i] is obj
      i++
  finalSelect = ($species, $cites) ->
    reg = new RegExp("^.*/" + $cites + "$")
    $scope.final_chosen = new Array()
    $scope.final_chosen = $species  if $cites is "nc"
    i = 0

    while i < $species.length
      $scope.final_chosen.push $species[i]  if reg.test($species[i]["current_listing"]) or $species[i]["current_listing"] is $cites
      i++
  $scope.species_chosen = new Array()
  $scope.levels = new Array()
  $scope.cites = "nc"
  $scope.select = ($name, $level) ->

    if include($scope.levels, $name) is true
      j = 0

      while j < $scope.species_chosen.length
        if $scope.species_chosen[j][$level] is $name
          $scope.species_chosen.splice j, 1
          j--
        j++
      $scope.levels.splice $scope.levels.indexOf($name), 1
    else
      i = 0

      while i < gon.creatures.length
        $scope.species_chosen.push gon.creatures[i]  if gon.creatures[i][$level] is $name
        i++
      $scope.levels.push $name
    finalSelect $scope.species_chosen, $scope.cites

  $scope.citesRestrict = ($cites) ->
    $scope.cites = $cites
    finalSelect $scope.species_chosen, $scope.cites

  $scope.sectionChange = ->
    $scope.species_chosen = new Array()
    $scope.levels = new Array()
    $scope.final_chosen = new Array()

  $scope.sectionChangeOut = ->
    $scope.sectionChange()
    document.getElementById('cites').style.display= "none"

  $scope.sectionChangeIn = ->
    $scope.sectionChange()
    document.getElementById('cites').style.display= 'block'
]