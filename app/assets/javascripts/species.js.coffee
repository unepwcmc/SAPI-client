json = [
  {
    "cites_accepted":true,
    "class_name":"Aves",
    "family_name":"Accipitridae",
    "full_name":"Accipiter brevipes",
    "genus_name":"Accipiter",
    "hash_ann_symbol":null,
    "id":5324,
    "kingdom_name":"Animalia",
    "order_name":"Falconiformes",
    "phylum_name":"Chordata",
    "rank_name":"SPECIES",
    "species_name":"Brevipes",
    "recently_changed":false,
    "current_parties_ids":[],
    "current_listing":"II",
    "english_names":[
      "Levant Sparrowhawk"
    ]
  },
  {
    "cites_accepted":true,
    "class_name":"Aves",
    "family_name":"Accipitridae",
    "full_name":"Accipiter gentilis",
    "genus_name":"Accipiter",
    "hash_ann_symbol":null,
    "id":5170,
    "kingdom_name":"Animalia",
    "order_name":"Falconiformes",
    "phylum_name":"Chordata",
    "rank_name":"SPECIES",
    "species_name":"Gentilis",
    "recently_changed":false,
    "current_parties_ids":[],
    "current_listing":"II",
    "english_names":[
      "Goshawk",
      "Northern Goshawk"
    ]
  },
  {
    "cites_accepted":false,
    "class_name":"Actinopterygii",
    "family_name":"Acipenseridae",
    "full_name":"Acipenser sturio",
    "genus_name":"Acipenser",
    "hash_ann_symbol":null,
    "id":8833,
    "kingdom_name":"Animalia",
    "order_name":"Acipenseriformes",
    "phylum_name":"Chordata",
    "rank_name":"SPECIES",
    "species_name":"Sturio",
    "recently_changed":false,
    "current_parties_ids":[],
    "current_listing":"I",
    "english_names":[
      "Atlantic Sturgeon",
      "Baltic Sturgeon",
      "Common Sturgeon",
      "European Sturgeon",
      "Sea Sturgeon",
      "Sturgeon"
    ]
  },
  {
    "cites_accepted":false,
    "class_name":"Mammalia",
    "family_name":"Balaenopteridae",
    "full_name":"Balaenoptera borealis",
    "genus_name":"Balaenoptera",
    "hash_ann_symbol":null,
    "id":9834,
    "kingdom_name":"Animalia",
    "order_name":"Cetacea",
    "phylum_name":"Chordata",
    "rank_name":"SPECIES",
    "species_name":"Borealis",
    "recently_changed":false,
    "current_parties_ids":[],
    "current_listing":"I",
    "english_names":[
      "Coalfish Whale",
      "Pollack Whale",
      "Rudophi's Rorqual",
      "Sei Whale"
    ]},
  {
    "cites_accepted":false,
    "class_name":"Mammalia",
    "family_name":"Balaenopteridae",
    "full_name":"Balaenoptera physalus",
    "genus_name":"Balaenoptera",
    "hash_ann_symbol":null,
    "id":6060,
    "kingdom_name":"Animalia",
    "order_name":"Cetacea",
    "phylum_name":"Chordata",
    "rank_name":"SPECIES",
    "species_name":"Physalus",
    "recently_changed":false,
    "current_parties_ids":[],
    "current_listing":"I",
    "english_names":[
      "Common Rorqual",
      "Fin Whale",
      "Fin-backed Whale",
      "Finback",
      "Finner",
      "Herring Whale",
      "Razorback"
    ]
  },
  {
    "cites_accepted":false,
    "class_name":"Mammalia",
    "family_name":"Canidae",
    "full_name":"Canis lupus",
    "genus_name":"Canis",
    "hash_ann_symbol":null,
    "id":7543,
    "kingdom_name":"Animalia",
    "order_name":"Carnivora",
    "phylum_name":"Chordata",
    "rank_name":"SPECIES",
    "species_name":"Lupus",
    "recently_changed":false,
    "current_parties_ids":[],
    "current_listing":"I/II",
    "english_names":[
      "Common Wolf",
      "Grey Wolf",
      "Timber Wolf",
      "Wolf"
    ]
  },
  {
    "cites_accepted":true,
    "class_name":"Reptilia",
    "family_name":"Cheloniidae",
    "full_name":"Caretta caretta",
    "genus_name":"Caretta",
    "hash_ann_symbol":null,
    "id":11044,
    "kingdom_name":"Animalia",
    "order_name":"Testudines",
    "phylum_name":"Chordata",
    "rank_name":"SPECIES",
    "species_name":"Caretta",
    "recently_changed":false,
    "current_parties_ids":[],
    "current_listing":"I",
    "english_names":[
      "Loggerhead"
    ]}
  ]
data = JSON.parse json

@SpeciesCtrl = ($scope) ->

  $scope.selectClass = ->
    for creature in data
      console.log(creature)
