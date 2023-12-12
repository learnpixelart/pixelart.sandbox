###############################
# to run use:
#    $  ruby sandbox/base.rb

#  generate base types with default eyes

require 'pixelart'

require_relative '../base'





specs = parse_data( <<DATA )
 ## archetypes
   brown, eyes-left
   gray, eyes-left
   green, eyes-left
   pink, eyes-left
   purple, eyes-left
   red, eyes-left
   white, eyes-left

   alien, eyes-alien
   boned, eyes-left
   bot, eyes-bot
   deathbot, eyes-deathbot
   demon, eyes-demon
   golden, eyes-left
   hyena, eyes-left
   mempool, eyes-left
   pepe, eyes-pepe
   pepe-block, eyes-pepe
   rainbow, eyes-left
   safemode, eyes-left
   zombie, eyes-zombie
DATA


specs = parse_data( <<DATA )
 ## archetypes
   blue, eyes-left
   blue-orc, eyes-left
   gold, eyes-left
   gold-orc, eyes-left
   greener, eyes-left
   greener-orc, eyes-left
   orange, eyes-left
   orange-orc, eyes-left
   orange2, eyes-left
   orange2-orc, eyes-left
DATA


specs.each_with_index do |spec, i|
     name = spec[0]
     img = generate( *spec)
     img.save( "./tmp4/#{name}.png" )
     img.zoom(10).save( "./tmp4/10x/#{name}@10x.png" )
end

puts "bye"
