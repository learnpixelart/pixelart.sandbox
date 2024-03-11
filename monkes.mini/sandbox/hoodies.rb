###############################
# to run use:
#    $  ruby sandbox/hoodies.rb


require 'pixelart'



HOODIE = Image.read( "./attributes/hoodies/hoodie.png" )
COLOR1 =  '#292929'   # (default) hoodie colors
COLOR2 =  '#3C3C3C'
COLOR3 =  '#6D6D6D'


hues = [270, 240, 210,
        180, 150, 120,
         90,  60, 30,
          0,    # red-ish 
          310   # pink-ish
        ]

  i = 0
  hues.each do |hue|
     [0.15,0.5].each do |v|          
       color1 = Color.from_hsv( hue, 1.0, 0.16 + v )
       color2 = Color.from_hsv( hue, 1.0, 0.23 + v)
       color3 = Color.from_hsv( hue, 1.0, 0.42 + v)
     
       color_map = { COLOR1 => color1,
                     COLOR2 => color2,
                     COLOR3 => color3, 
                   }
       hoodie = HOODIE.change_colors( color_map )
 
     hoodie.save( "./tmp2/hoodie#{i+2}.png" )
     hoodie.zoom(10).save( "./tmp3/hoodie#{i+2}_#{hue}-#{v}@10x.png" )

     i+=1
    end
  end


puts "bye"

