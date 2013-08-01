require 'json'

file = File.read('short.json')

all_species = JSON.parse(file)

out_hash = {"name" => "Kingdom", "children" => []}
previous = out_hash

order_list = ['kingdom_name', 'phylum_name', 'class_name', 'order_name', 'family_name', 'genus_name', 'species_name', 'full_name']


all_species.each do |animal|
  order_list.each_with_index do |element, index|
    unless animal[order_list[index]].nil?
      if previous["children"].any? { |kid| kid["name"] == animal[order_list[index]] }
      current = {"name" => animal[order_list[index]], "children" => []}
      previous["children"] << current
      previous = current
    end
  end
end

binding.pry