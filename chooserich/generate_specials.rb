require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
  bg bitcoin orange, nick, mouth, short hair, cool shades blue 
  bg bitcoin orange, nick, smile, hair 1, cool shades blue 
  bg bitcoin orange, nick, smile big, hair 2, cool shades blue 
  bg bitcoin pattern, nick gold, mouth, short hair, cool shades blue 
  bg bitcoin pattern, nick gold, smile, hair 1, cool shades blue 
  bg bitcoin pattern, nick gold, smile big, hair 2, cool shades blue 

  bg dollar pattern, joe, smile, cool shades blue
  bg bitcoin pattern, joe gold, smile big, cool shades blue
  bg blue, joe, smile, cool shades blue
  bg blue, joe gold, smile big, cool shades blue
  bg usa, joe, smile, cool shades blue
  bg usa, joe gold, smile big, cool shades blue

  bg dollar pattern, donald, smile, cool shades blue
  bg bitcoin pattern, donald gold, smile big, cool shades blue
  bg red, donald, smile, cool shades blue
  bg red, donald gold, smile big, cool shades blue
  bg usa, donald, smile, cool shades blue
  bg usa, donald gold, smile big, cool shades blue
DATA



cols = 6
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 28, height: 28 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp2/chooserich#{i}.png" )
     img.zoom(10).save( "./tmp2/chooserich#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp2/chooserich.png" )
composite.zoom(4).save( "./tmp2/chooserich@4x.png" )


puts "bye"
