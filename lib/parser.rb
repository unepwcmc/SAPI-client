module Parser
  def tree()
    file = File.read('app/assets/javascripts/species_list.json')

    all_species = JSON.parse(file)

    out_hash = {"name" => "Kingdom", "children" => []}

    order_list = ['kingdom_name', 'phylum_name', 'class_name', 'order_name', 'family_name', 'genus_name', 'species_name', 'full_name']


    all_species.each do |animal|
      previous = out_hash
      order_list.each do |term|
        if animal[term].nil?
          current = {"name" => "", "children" => []}
          previous["children"] << current
          previous = previous["children"].find { |kid| kid["name"] == ""}
        else
          field = animal[term]
          if previous["children"].none? { |kid| kid["name"] == field }
            current = {"name" => field, "children" => []}
            previous["children"] << current
          else
            current = previous["children"].find { |kid| kid["name"] == field }
          end
          previous = previous["children"].find { |kid| kid["name"] == field }
        end
      end
    end

    File.open("app/assets/javascripts/species_tree.json","w") do |f|
      f.write(out_hash.to_json)
    end
  end

  def add_gbif_images()
    species_string = '';

    File.open("app/assets/javascripts/species_list.json", "r").each_line do |line|
      species_string += line
    end

    # out is an ARRAY of 141 endangered species each presented as HASH which has keys like "kingdom_name", "phylum name", etc.
    species_array =  JSON.parse(species_string)


    species_array.each do |creature|
      name = creature['full_name'].gsub(/ /, '%20')
      @doc = Nokogiri::HTML(open("http://data.gbif.org/ws/rest/taxon/list?scientificname=#{name}&dataproviderkey=1&rank=species"))
      gbif_taxon = @doc.children.to_s.match(/gbifkey=.(\d){7}/)[0][9,7]
      creature['id_gbif'] = gbif_taxon

      begin
        timeout(4) do
          images ||= Google::Search::Image.new(:query => creature['full_name'], :image_size => :large).take(1)
          # binding.pry
          creature['img_src'] = images[0].uri
        end
      rescue OpenURI::HTTPError, SocketError, TimeoutError
        []
      end
    end

    File.open("app/assets/javascripts/species_list_gbif.json","w") do |f|
      f.write(species_array.to_json)
    end
  end

end