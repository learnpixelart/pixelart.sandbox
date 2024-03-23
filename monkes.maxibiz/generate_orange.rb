require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )

  maxibiz, lasereyes orange
  maxibiz, mohawk, lasereyes 2 orange 
  maxibiz, top hat, lasereyes orange
  maxibiz, cap mcb, lasereyes 2 orange
  maxibiz, cap ordinal, lasereyes orange  
  maxibiz, wizard hat, lasereyes 2 orange
  maxibiz, hoodie, lasereyes orange
  maxibiz, hoodie, lasereyes 2 orange
  maxibiz, hoodie (ii), lasereyes 2 orange

  maxibiz 2, hoodie, lasereyes orange
  maxibiz 2, hoodie, lasereyes 2 orange
  maxibiz 2, hoodie (ii), lasereyes 2 orange
  maxibiz 2, lasereyes orange
  maxibiz 2, mohawk (ii), lasereyes 2 orange
  maxibiz 2, cap mcd, lasereyes orange
  maxibiz 2, french cap, lasereyes 2 orange 
  maxibiz 2, cap ordinal, lasereyes orange  
  maxibiz 2, crown, lasereyes 2 orange 
 
  maxibiz 3, cowboy hat, lasereyes orange
  maxibiz 3, bandana (ii), lasereyes orange
  maxibiz 4, cap (ii), lasereyes orange

  maxibiz 4, knitted cap, lasereyes orange
  maxibiz 4, top hat (ii), lasereyes 2 orange

  maxibiz
  maxibiz 2
  maxibiz 3
  maxibiz 4

  maxibiz 3, lasereyes orange
  maxibiz, hoodie (ii)
  maxibiz 2, hoodie (ii)
  maxibiz, hoodie (ii), lasereyes orange
  maxibiz, hoodie (ii), lasereyes 2 orange

  maxibiz 2, hoodie (ii), lasereyes orange
  maxibiz 2, hoodie (ii), lasereyes 2 orange

  maxibiz, mohawk
  maxibiz, mohawk 2
  maxibiz, mohawk (ii)
  maxibiz, mohawk 2 (ii)
  maxibiz, peakspike
  maxibiz, bob


  maxibiz, crown
  maxibiz, french cap
  maxibiz, knitted cap
  maxibiz,  cowboy hat
  maxibiz,  wizard hat
  maxibiz,  cap mcd
  maxibiz,  top hat

  maxibiz, crown (ii)
  maxibiz, wizard hat (ii)
  maxibiz, wizard hat (iia)
  maxibiz, top hat (ii)
  maxibiz, bandana (ii)
  maxibiz, cap (ii)
  maxibiz, cap (iia)
  

  maxibiz, 3d glasses
  maxibiz 2, eyes monobrow
  maxibiz 2, eyes monobrow, cap ordinal
DATA


cols = 7
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 28, height: 28 )


specs.each_with_index do |spec, i|
  attribs =  ['background white']
  attribs += spec
  
  img = generate( *attribs )
  img.save( "./tmp3/orange#{i}.png" )
  img.zoom(10).save( "./tmp3/orange#{i}@10x.png" )
  composite << img

end


composite.save( "./tmp3/orange_ii.png" )
composite.zoom(4).save( "./tmp3/orange_ii@4x.png" )



##
# use inverted colors black <=> white


cols = 7
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 28, height: 28 )

specs.each_with_index do |spec, i|
      lasereyes = if spec[-1].index( 'lasereyes')
                       spec.pop   # get/remove last item from array 
                  else
                      nil
                  end

     base = generate( *spec )
     base = base.invert

     img = generate( 'background black' )
     img.compose!( base )
     img.compose!( generate( lasereyes))   if lasereyes

     img.save( "./tmp3/orangeii#{i}.png" )
     img.zoom(10).save( "./tmp3/orangeii#{i}@10x.png" )
     composite << img
end

composite.save( "./tmp3/orangeii.png" )
composite.zoom(4).save( "./tmp3/orangeii@4x.png" )






puts "bye"
