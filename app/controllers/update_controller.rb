class UpdateController < ApplicationController
  require 'net/http'

  def update

    fields = ['id', "full_name", "class_name","family_name","genus_name","id","kingdom_name","order_name","phylum_name","species_name","cites_listing", "english_names"]
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

    url = URI.parse("http://sapi.unepwcmc-012.vm.brightbox.net/api/v1/taxon_concepts?geo_entities_ids[]=#{country_id}&taxonomy=cites_eu&page=1&per_page=200")
    req = Net::HTTP::get(url)
    dane = JSON.load(req)
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
        if field_name == "common_names"
          field_value.each do |field|
            all_species[index]['english_names'] = field['names'] if field['lang'] == 'English'
            all_species[index]['polish_names'] = field['names'] if field['lang'] == 'Polish'
          end
        end
      }
      if !all_species[index]['polish_names']
        find_polish_name(all_species[index]['full_name'])
        a = @polish_name
        all_species[index]['polish_names'] = a + "<i style='font-size: 13px'> (Wikipedia)</i>"
      end
    end

    File.open("app/assets/javascripts/species_list.json","w") do |f|
      f.write(all_species.to_json)
    end

    tree()
    add_gbif_images()

  end
end
