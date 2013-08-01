require 'json'

file = File.read('short.json')

all_species = JSON.parse(file)

out_hash = {"name" => "Kingdom", "children" => []}
previous = out_hash

dog = all_species.first

order_list = ['kingdom_name', 'phylum_name', 'class_name', 'order_name', 'family_name', 'genus_name', 'species_name', 'full_name']

order_list.each_with_index do |element, index|
  unless dog[order_list[index]].nil?
    current = {"name" => dog[order_list[index]], "children" => []}
    previous["children"] << current
    previous = current
  end
end

puts out_hash