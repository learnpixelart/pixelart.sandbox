require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
  nick, mouth
  nick, mouth, short hair, cool shades blue 
  nick, smile, short hair, cool shades blue 
  nick, mouth, short hair, cool shades green
  nick, smile, short hair, cool shades green
  nick, mouth, short hair, cool shades red
  nick, smile, short hair, cool shades red
  nick, mouth, hair 1, cool shades blue 
  nick, smile, hair 1, cool shades blue 
  nick, smile, hair 2, cool shades blue 
  nick, smile big, hair 2, cool shades blue 
  nick, smile, hair 2, cool shades green
  nick, smile big, hair 2, cool shades green 
  bg bitcoin orange,  nick,  smile, short hair, cool shades blue 
  bg bitcoin pattern, nick,  smile,  short hair, cool shades blue
  nick, smile big, short hair, cool shades blue 
  bg bitcoin orange,  nick, smile big, short hair, cool shades blue 
  bg bitcoin pattern,   nick, smile big, short hair, cool shades blue

  joe, smile
  joe gold, smile big
  joe, smile, cool shades blue
  joe gold, smile big, cool shades blue
  bg usa, joe, smile, cool shades blue
  bg usa, joe gold, smile big, cool shades blue

  donald, smile
  donald gold, smile big
  donald, smile, cool shades blue
  donald gold, smile big, cool shades blue
  donald, smile, cool shades red
  donald gold, smile big, cool shades red
  bg usa, donald, smile, cool shades red
  bg usa, donald gold, smile big, cool shades red

  nick gold, mouth
  nick gold, mouth, short hair, cool shades blue
  nick gold, smile, short hair, cool shades blue
  bg bitcoin orange,  nick gold, smile, short hair, cool shades blue
  bg bitcoin pattern,  nick gold, smile big, short hair, cool shades blue
 
  nick (ii), mouth
  nick (ii), mouth, short hair, cool shades blue 
  nick (iii), mouth
  nick (iii), mouth, short hair, cool shades blue 
  nick (ii) gold, mouth 
  nick (ii) gold, mouth, short hair, cool shades blue
DATA



cols = 5
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 28, height: 28 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp/chooserich#{i}.png" )
     img.zoom(10).save( "./tmp/chooserich#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp/chooserich.png" )
composite.zoom(4).save( "./tmp/chooserich@4x.png" )


puts "bye"
