###############################
# to run use:
#    $  ruby sandbox/base.rb

#  generate base types with default eyes

require 'pixelart'

require_relative '../base'





specs = parse_data( <<DATA )
 ## archetypes

 albino, eyes-left
 brown, eyes-left
 dark, eyes-left
 demon, eyes-demon
 golden-block, eyes-left
 golden, eyes-left
 pink, eyes-left-blue
 gray-block, eyes-left
 gray, eyes-left
 green, eyes-left
 memepool, eyes-left
 pepe, eyes-pepe
 alien, eyes-alien
 deathbot, eyes-red
 safemode, eyes-left
 zombie,  eyes-zombie
DATA


specs.each_with_index do |spec, i|
     name = spec[0]
     img = generate( *spec)
     img.save( "./tmp2/#{name}.png" )
     img.zoom(10).save( "./tmp2/10x/#{name}@10x.png" )
end

puts "bye"
