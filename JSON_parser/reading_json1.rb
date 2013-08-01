require 'json/ext'
require 'json/add/core'


# File.open("math_map_compact.json", "r").each_line do |line|
#   puts line
# end

a = File.read('math_map_compact.json')
b = File.read('short.json')
puts JSON.parse(a)
