require 'json'

file = File.read('short.json')

all_species = JSON.parse(file)

# that's what we want as our result
out_hash = {"name" => "Kingdom", "children" => []}

# that's what we need for every node of our tree
pattern = { "name" => "", "children" => []}

i = 0

for creature in all_species
  kingdom = creature['kingdom_name']
  phylum = creature['phylum_name']
  creature_class = creature['class_name']
  order = creature['order_name']
  family = creature['family_name']
  genus = creature['genus_name']
  species = creature['species_name']
  full_name = creature['full_name']

  if out_hash["children"].empty?
    out_hash["children"] << pattern
    out_hash["children"][i]["name"] = kingdom
  else
    out_hash["children"] << pattern
    puts out_hash["children"]
    i = i+1
    out_hash["children"][i]["name"] = kingdom
  end

  puts "small hash: ", out_hash

end

puts "Final hash: ", out_hash

# it should return
# {"name"=>"Kingdom", "children"=>[{"name"=>"Animalia", "children"=>[]}, {"name"=>"Plantae", "children"=>[]}]}