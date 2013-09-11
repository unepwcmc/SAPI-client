console.log("hoho");
var cfg = new Object();
    cfg.context="/";
    cfg.currentUrl="http://uat.gbif.org/cfg";
    cfg.serverName= "http://uat.gbif.org";
    cfg.baseUrl = "http://uat.gbif.org";
    cfg.wsClb="http://api.gbif.org/";
    cfg.wsClbSearch="http://api.gbif.org/name_usage/search";
    cfg.wsClbSuggest="http://api.gbif.org/name_usage/suggest";
    cfg.wsReg="http://api.gbif.org/";
    cfg.wsRegSearch="http://api.gbif.org/dataset/search";
    cfg.wsRegSuggest="http://api.gbif.org/dataset/suggest";
    cfg.wsOcc="http://api.gbif.org/";
    cfg.wsMetrics="http://api.gbif.org/";
    cfg.wsOccSearch="http://api.gbif.org/occurrence/search";
    cfg.tileServerBaseUrl="http://api.gbif.org/map";
    cfg.wsOccCatalogNumberSearch = "http://api.gbif.org/occurrence/search/catalog_number";
    cfg.wsOccCollectorNameSearch = "http://api.gbif.org/occurrence/search/collector_name";
    cfg.wsOccCollectionCodeSearch = "http://api.gbif.org/occurrence/search/collection_code";
    cfg.wsOccInstitutionCodeSearch = "http://api.gbif.org/occurrence/search/institution_code";
    cfg.wsImageCache = "http://api.gbif.org/image";
var baseUrl = cfg.tileServerBaseUrl + '/density/tile?x={x}&y={y}&z={z}';

function getGBIFUrl() {

          var url = baseUrl
            + "&type=" + 'TAXON'
            + "&key=" + $('#id_gbif').text();
          console.log("GBIF layer template url: " +  url);
          $("#urlTemplate").html("<a href='" + url + "'>" + url + "</a>");
          return url;
        }

    var gbifAttrib='GBIF contributors';
    var gbif = new L.TileLayer(getGBIFUrl(), {minZoom: 0, maxZoom: 14, attribution: gbifAttrib});
      var cmAttr = 'Map data &copy; 2011 OpenStreetMap contributors, Imagery &copy; 2011 CloudMade',
      cmUrl = 'http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/{styleId}/256/{z}/{x}/{y}.png';
      var minimal   = L.tileLayer(cmUrl, {styleId: 22677, attribution: cmAttr});
      var midnight  = L.tileLayer(cmUrl, {styleId: 999,   attribution: cmAttr});

    var map = L.map('map', {
      center: [52, 20],
      zoom: 6,
      layers: [midnight, gbif]
    });

    L.control.layers({"Minimal": minimal, "Midnight":midnight}, {"GBIF": gbif}).addTo(map);

        $('.refresh,.layer,.color').click(function(event) {
          gbif.setUrl(getGBIFUrl());
        });

    // prototype util function
        if (typeof String.prototype.startsWith != 'function') {
            String.prototype.startsWith = function (str){
            return this.indexOf(str) == 0;
          };
        }

        $('.toggle').click(function(e) {
          e.preventDefault();
          $.each($('.layer'), function(i,d) {
            console.log(d.id);
            if (d.id.startsWith(e.target.id)) {
              d.checked = !d.checked;
            }
          });
          gbif.setUrl(getGBIFUrl());
        });
