require 'rubygems'
require 'json'

levels = ["kingdom_name", "phylum_name", "class_name", "order_name", "family_name", "genus_name", "species_name", "full_name"]
index = [0,1,2,3,4,5,6,7]
=begin
      Part 1 - reading the JSON file of Polish endangered species
      converting to string => array of hashes
=end

species_string = ""

File.open("species_list.json", "r").each_line do |line|
  species_string += line
end

# out is an ARRAY of 141 endangered species each presented as HASH which has keys like "kingdom_name", "phylum name", etc.
out =  JSON.parse(species_string)

# binding.pry

=begin
      Part 2 - reading an exmaple JSON file created manually
      the goal: see what kind of hash we expect to obtain finally from JSON file of Polish endangered species
=end

species_string_tree = ""

File.open("species_tree_example.json", "r").each_line do |line|
  species_string_tree += line
end

out2 =  JSON.parse(species_string_tree)

=begin
      Prototyping a tree
=end

tree = Hash.new
tree['name'] = 'Kingdom';
tree['children'] = Array.new
#out2.each do |species| #species is one animal - HASH!

out.each do |animal|
  if tree["children"].any?{|node| node['name'] == animal["kingdom_name"]}
    tree["children"].each_with_index do |kid, i|
      if kid["name"]== animal["kingdom_name"]
        index[0] = i
      end
    end
    if tree["children"][index[0]]["children"].any?{|node| node['name'] == animal["phylum_name"]}

      tree["children"][index[0]]["children"].each_with_index do |kid, i|
        if kid["name"]== animal["phylum_name"]
          index[1] = i
        end
      end

      if tree["children"][index[0]]["children"][index[1]]["children"].any?{|node| node['name'] == animal["class_name"]}
        tree["children"][index[0]]["children"][index[1]]["children"].each_with_index do |kid, i|
          if kid["name"]== animal["class_name"]
            index[2] = i
          end
        end

        if tree["children"][index[0]]["children"][index[1]]["children"][index[2]]["children"].any?{|node| node['name'] == animal["class_name"]}
          tree["children"][index[0]]["children"][index[1]]["children"][index[2]]["children"].each_with_index do |kid, i|
            if kid["name"]== animal["class_name"]
              index[3] = i
            end
          end
        else
          tree['children'][index[0]]["children"][index[1]]["children"][index[2]]["children"] << {"name" => animal["order_name"],
                           "children" => [{"name" => animal['family_name'], "children" =>Array.new}]}
        end

      else
        tree['children'][index[0]]["children"][index[1]]["children"] << {"name" => animal["class_name"],
                           "children" => [{"name" => animal['order_name'], "children" =>Array.new}]}
      end

    else
      tree['children'][index[0]]["children"] << {"name" => animal["phylum_name"],
                           "children" => [{'name' => animal['class_name'],
                          "children" => [{"name" => animal['order_name'], "children" =>Array.new}]}]}
    end
  else
    tree['children'] << {"name" => animal["kingdom_name"],
                          "children" => [{"name" => animal["phylum_name"],
                          "children" => [{'name' => animal['class_name'],
                          "children" => [{"name" => animal['order_name'], "children" =>Array.new}]}]}]}
  end

end

binding.pry


