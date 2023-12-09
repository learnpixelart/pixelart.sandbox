require 'pixelart'


shroom = Image.read( "shroom24x24.png")


composite = ImageComposite.new( 4, 3, width: 24, height: 24 )


[30, 0, 330, 300, 270, 240, 210, 180, 150, 120, 90, 60].each do |hue|

    color1 = Color.from_hsv( hue,  0.4862745098039216, 1.0  )
    color2 = Color.from_hsv( hue,  0.541871921182266, 0.796078431372549 )

    color_map = {
     '#ffae83ff' => color1,
     '#cb835dff' => color2,
    }

    new_shroom = shroom.change_colors( color_map )
    new_shroom.save( "./tmp/shroom_#{hue}.png")
    new_shroom.zoom( 3 ).save( "./tmp/shroom_#{hue}@3x.png")

    bg = Color.from_hsv( hue,  1.0, 1.0  )

    frame = Image.new( 24, 24, bg )
    frame.compose!( new_shroom ) 
    frame.zoom( 3 ).save( "./tmp/shroom_#{hue}-bg.png")
    frame.zoom( 3 ).save( "./tmp/shroom_#{hue}-bg@3x.png")

    composite << frame
end


composite.save( "./tmp/shrooms.png" )
composite.zoom(4).save( "./tmp/shrooms@4x.png" )
composite.zoom(8).save( "./tmp/shrooms@8x.png" )



###############
# Example  - Pop Art Tableau 
composite = ImageComposite.new( 8*3, 8*2, width: 24, height: 24 )

(3*16).times do
[60, 30, 0, 330, 300, 210, 180, 120] .each do |hue|

    saturation =  0.13
  
   color1 = Color.from_hsv( hue,  0.4862745098039216+saturation, 1.0  )
   color2 = Color.from_hsv( hue,  0.541871921182266+saturation, 0.796078431372549 )

   color_map = {
    '#ffae83ff' => color1,
    '#cb835dff' => color2,
   }

   new_shroom = shroom.change_colors( color_map )
 
   composite << new_shroom
end
end


composite.save( "./tmp/popart_shrooms.png" )
composite.zoom(2).save( "./tmp/popart_shrooms@2x.png" )

puts "bye"
