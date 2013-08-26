@GameCtrl = [ "$scope", ($scope) ->
  $scope.start = ->
    console.log("hshshshsh")
    l = gon.creatures.length
    three_to_play = new Array()
    three_to_play.push(gon.creatures[Math.floor(Math.random() * l)]) for x in [0..2]
    `function find_src(name){
      console.log(name);

      google.load('search', '1', {"nocss": true, "nooldnames": true});

      var imageSearch;

      function searchComplete() {

        // Check that we got results
        if (imageSearch.results && imageSearch.results.length > 0) {

          // Loop through our results, printing them to the page.
          var results = imageSearch.results;
          console.log(results[0]['tbUrl']);

        }
      }

      function OnLoad() {

        // Create an Image Search instance.
        imageSearch = new google.search.ImageSearch();

        // Set searchComplete as the callback function when a search is
        // complete.  The imageSearch object will have results in it.
        imageSearch.setSearchCompleteCallback(this, searchComplete, null);

        // Find me a species.
        imageSearch.execute(name);
      }
      google.setOnLoadCallback(OnLoad);
      }`
    src = find_src three_to_play[0]['full_name']

]