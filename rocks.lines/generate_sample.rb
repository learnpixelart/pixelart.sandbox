require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )

rock safemode, bandana2
rock safemode, top hat

rock memepool
rock memepool, 3d glasses

rock pepe
rock pepe, cap mcb, regular shades
rock pepe, mohawk purple

rock pink, cap mcb
rock pink, mohawk blonde

rock alien, bandana
rock alien, headband
rock alien, cap
rock alien, mohawk pink, regular shades

rock golden, cap mcb
rock golden, lasereyes red
rock golden, bandana, eyes polarized
rock golden, mohawk red
rock golden, mohawk blonde

rock golden block, lasereyes red
rock 1bit block
rock 1bit
DATA



cols = 7
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite  = ImageComposite.new( cols, rows, 
                                  width: 28, height: 28 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp/line#{i}.png" )
     img.zoom(10).save( "./tmp/line#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp/lines.png" )
composite.zoom(4).save( "./tmp/lines@4x.png" )

puts "bye"
