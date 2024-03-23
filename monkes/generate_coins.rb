require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
  orange orc, hoodie orange, laser eyes red 
  orange orc, eyes big, mohawk red

  deathbot, eyes left, hoodie orange
  deathbot, eyes deathbot, mohawk purple

  gray, eyes right, hoodie purple, 3d glasses
  gray, eyes right, cap terminal 2

  # aliens
  alien, eyes left, hoodie
  alien, hoodie, laser eyes red
  alien, eyes left, mohawk 
  alien, eyes right, cap ordinal
  alien, 3d glasses, mohawk purple
  alien, eyes big, bandana

  # monke kings
  golden, eyes right, crown
  golden, 3d glasses, crown
  golden, crown, laser eyes red
  golden, eyes left, vr,  crown
  golden, eyes zombie, crown
  golden, eyes monobrow, crown

  # more 
  pepe, eyes pepe, cap mcb
  pepe block, eyes pepe

  greener orc, eyes monobrow, cap terminal
DATA



specs.each_with_index do |spec, i|
    img = generate( *spec)
    img.save( "../monkes.coins/tmp/monke#{i}.png" )
    img.zoom(10).save( "../monkes.coins/tmp/monke#{i}@10x.png" )
end



puts "bye"
