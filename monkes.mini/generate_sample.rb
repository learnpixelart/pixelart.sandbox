require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
  alien, eyes left, hoodie
  alien, hoodie, laser eyes red
  alien, shades polarized, mohawk 

  alien, eyes right, cap ordinal
  alien, 3d glasses, mohawk purple
  alien, eyes big, bandana

  # monke kings
  golden, eyes right, crown
  golden, 3d glasses, crown
  golden, crown, laser eyes red
  golden, eyes deathbot, crown
  golden, eyes zombie, crown
  golden, shades polarized, crown

  # more
  orange orc, hoodie orange, laser eyes red 
  
   gray, hoodie purple, 3d glasses
   deathbot, eyes deathbot, hoodie orange

   brown, eyes pepe, flathat
   pink,  eyes big, frenchcap

   gray,  eyes bot
   gray,  eyes bot green, mohawk

   greener orc, eyes bot green, mohawk

   orange orc, eyes left, knitted cap
   orange orc, eyes left, knitted cap 2

   alien, eyes big, bandana 2 

   greener orc, eyes bot green, cap army
   brown, eyes left, cap

   pepe, eyes pepe, cowboy hat
   deathbot, eyes deathbot, halo
DATA



cols = 10
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp/monke#{i}.png" )
     img.zoom(10).save( "./tmp/monke#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp/monkes12px.png" )
composite.zoom(8).save( "./tmp/monkes12px@8x.png" )


puts "bye"
