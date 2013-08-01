require 'json'

file = File.read('just_one.json')
all_species = JSON.parse(file)

out_hash = {"name" => "Kingdom", "children" => []}
pattern = { "name" => "", "children" => []}
i,j = 0
all_species.each do |creature|
  out_hash['children']<<pattern
  i = out_hash['children'].length-1
  out_hash['children'][i]['name'] = creature['kingdom_name']
  out_hash['children']['children']<<pattern
  out_hash['children'][j]['name'] = creature['phylum_name']


  # phylum = creature['phylum_name']
  # creature_class = creature['class_name']
  # order = creature['order_name']
  # family = creature['family_name']
  # genus = creature['genus_name']
  # species = creature['species_name']
  # full_name = creature['full_name']



end
puts out_hash
