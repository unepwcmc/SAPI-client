class UpdateController < ApplicationController
  require 'net/http'

  def update

    fields = ["full_name", "class_name","family_name","genus_name","id","kingdom_name","order_name","phylum_name","species_name","current_listing", "english_names"]
    all_species = Array.new

    url = URI.parse('http://sapi.unepwcmc-012.vm.brightbox.net/api/v1/geo_entities?designation=cites&geo_entity_types[]=country')
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    country_id = 0
    dane = JSON.load(res.body)
    dane['geo_entities'].each do |country|
      country_id = country['id'] if country['name'].eql? 'Poland'
    end

    url = URI.parse("http://sapi.unepwcmc-012.vm.brightbox.net/api/v1/taxon_concepts?geo_entities_ids[]=#{country_id}&taxonomy=cites_eu")
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    dane = JSON.load(res.body)
    species_ids = Array.new
    dane['taxon_concepts'].each do |species|
      species_ids << species['id']
    end

    species_ids.each_with_index do |id, index|
      all_species << Hash.new
      url = URI.parse("http://sapi.unepwcmc-012.vm.brightbox.net/api/v1/taxon_concepts/#{id}")
      req = Net::HTTP::Get.new(url.path)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }

      dane = JSON.load(res.body)
      dane['taxon_concept'].each {|field_name, field_value|
        all_species[index][field_name] = field_value if fields.include? field_name
      }
    end

  end
end
