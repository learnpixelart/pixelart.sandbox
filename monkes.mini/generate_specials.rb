require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
  orange orc, hoodie orange, laser eyes red 
  orange orc, eyes big, mohawk red

  deathbot, eyes deathbot, hoodie orange
  deathbot, eyes deathbot, mohawk purple

  gray, hoodie purple, 3d glasses
  gray, cap terminal 2

  # aliens
  alien, eyes left, hoodie
  alien, hoodie, laser eyes red
  alien, shades polarized, mohawk 
  alien, eyes right, cap ordinal
  alien, 3d glasses, mohawk pink
  alien, eyes big, bandana

  # monke kings
  golden, eyes right, crown
  golden, 3d glasses, crown
  golden, crown, laser eyes red
  golden, eyes deathbot, crown
  golden, eyes zombie, crown
  golden, shades polarized, crown

  # more 
  pepe, eyes pepe, cap mcb
  pepe block, eyes pepe

  greener orc, eyes monobrow, cap terminal
DATA



cols = 7
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp4/mini#{i}.png" )
     img.zoom(10).save( "./tmp4/@10x/mini#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp4/minis.png" )
composite.zoom(8).save( "./tmp4/minis@8x.png" )


puts "bye"
