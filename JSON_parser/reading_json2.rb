require 'json'

short = File.read('short.json')

short_parsed = JSON.parse(short)

puts short_parsed

# temp = File.open('oo.rb', 'w+')
# temp = File.write(JSON.parse(short), 'w')