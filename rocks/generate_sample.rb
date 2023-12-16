require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
 ## archetypes

 maxibiz
 black
 default
 albino, eyes-left
 brown, eyes-left
 dark, eyes-left
 demon, eyes-demon
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

 maxibiz, vr, mohawk
 black, vr, mohawk-purple 
 default, vr, mohawk-blonde 
 albino, eyes-left, vr, mohawk-red
 brown, eyes-left, vr, mohawk2
 dark, eyes-left, vr, mohawk2-green
 demon, eyes-demon, vr, halo
 golden, eyes-left, vr, crown
 pink, bob-blonde, eyes-left-blue, vr  
 gray-block, eyes-left, vr
 gray, eyes-left, vr, mohawk2-pink
 green, eyes-left, vr, mohawk2-red
 memepool, eyes-left, vr, peakspike
 pepe, eyes-pepe, vr, peakspike-blonde
 alien, eyes-alien, vr, peakspike-purple
 deathbot, eyes-red, vr, wildhair-red
 safemode, eyes-left, vr, wildhair
 zombie,  eyes-zombie, vr, mohawk-red


 maxibiz, lasereyes red, tophat
 black,  3dglasses, knittedcap
 default, eyes-big, headband
 albino, eyes-blend, cap
 brown, eyes-blue, bandana
 dark, eyes-zombie, cap mcb
 demon, eyes-cool, cap mcd
 golden, eyes-rainbow, crown
 pink, wildhair-blonde, eyes-cool  
 gray-block, eyes-pepe
 gray, eyes-polarized, cap subway
 green, lasereyes gold, cap burgerking
 memepool, eyes-big, knittedcap2
 pepe, eyes-red, cap mcb
 alien, eyes-blue, headband
 deathbot, 3dglasses, cowboyhat
 safemode, eyes-bored, bandana2
 zombie,  eyes-red,  bandana


DATA



cols = 10
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite  = ImageComposite.new( cols, rows, 
                                  width: 28, height: 28 )
composite2 = ImageComposite.new( cols, rows, 
                                  width: 28, height: 28 )

 backgrounds = [ 
    'bitcoin pattern',
    'red',  
    'green',  
    'dollar pattern', 
    'blue',
    'euro pattern',
    'aqua',
    'classic',
    'rainbow',
    'ukraine',
    'usa',
    'china',
    'great britain',
    'europe',
    'austria',
  ] 

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp/rock#{i}.png" )
     img.zoom(10).save( "./tmp/rock#{i}@10x.png" )
     composite << img


     base = spec[0]
     ## auto-add backgrounds
     bg =  if base.index( 'default' )
             'default'   ### bg default exclusive for default
          elsif base.index( 'maxibiz' )
            'bitcoin orange'
          elsif base.index( 'golden') 
            'yellow'   ## bg yellow exclusive for golden - why? why not?
          else
            backgrounds[i % backgrounds.size ] 
          end

    bg_key = "bg" + bg.downcase.gsub( /[^a-z0-9]/, '')

    frame  = Image.new( 28, 28 )
    frame.compose!( ATTRIBUTES[ bg_key ] )
    frame.compose!( img )
 

    frame.save( "./tmp/rock#{i}_bg.png" )
    frame.zoom(10).save( "./tmp/rock#{i}_bg@10x.png" )
    composite2 << frame
end


composite.save( "./tmp/rocks.png" )
composite.zoom(4).save( "./tmp/rocks@4x.png" )

composite2.save( "./tmp/rocks_bg.png" )
composite2.zoom(4).save( "./tmp/rocks_bg@4x.png" )


puts "bye"
