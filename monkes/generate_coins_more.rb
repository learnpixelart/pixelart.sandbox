require 'pixelart'


require_relative 'base'


## todo - check eyes left / right  in wrong order?
##   eyes left is default (with black pix on right?)

specs = parse_data( <<DATA )
  gray, eyes left,  peakspike red           #11000 
  deathbot, eyes deathbot, mohawk blonde    #2220 

DATA



specs.each_with_index do |spec, i|
    img = generate( *spec)
    img.save( "../monkes.coins/tmp/more/monke#{i}.png" )
    img.zoom(10).save( "../monkes.coins/tmp/more/monke#{i}@10x.png" )
end



puts "bye"
