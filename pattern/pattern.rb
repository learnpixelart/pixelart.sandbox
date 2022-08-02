####################
#  to run use:
#     $ ruby ./pattern.rb


require 'pixelart'


punk = Image.read( './morepunk88.png')   # 24x24


##
#  for images see
#     https://github.com/glasnt/ih



# beads
perler = Image.read( './perler.png' )   # 60x60
# bricks
lego   = Image.read( './lego.png' )     # 60x60

# (cross-)stitches
wool   = Image.read( './wool.png' )     # 150x150
floss  = Image.read( './floss.png' )     # 117x119




def gen_punk( punk, pattern:,
                 transparent: 0x0,
                 white:       0xffffff )

  transparent_color = Color.parse( transparent )
  white_color       = Color.parse( white )

  preview = ImageComposite.new( punk.width, punk.height,
               width:  pattern.width,
               height: pattern.height)

  punk.height.times do |y|
    punk.width.times do |x|
      color = punk[x,y]

       ## change transparent (& white) to white-ish
       color = white_color        if color == 0xffffffff
       color = transparent_color  if color == 0x0

      pix = Image.new( pattern.width, pattern.height )
      if color != 0x0
        pix.compose!( Image.new( pattern.width, pattern.height, color ))
        pix.compose!( pattern )
      end

      preview << pix
   end
  end
  preview
end


# White (P01), #f1f1f1
punk_perler = gen_punk( punk, pattern: perler, white: '#f1f1f1' )
punk_perler.save( "./tmp/punk_perler.png" )

# turn transparent into yellow
punk_lego = gen_punk( punk, pattern: lego, transparent: '#ffff00' )
punk_lego.save( "./tmp/punk_lego.png" )

# via alpaca.txt   White, #e1dbd2
punk_wool = gen_punk( punk, pattern: wool,
                                transparent: '#e1dbd2',
                                white:       '#e1dbd2' )
punk_wool.save( "./tmp/punk_wool.png" )

# White, #fcfbf8
punk_floss = gen_punk( punk, pattern: floss,
                                     transparent: '#fcfbf8',
                                     white:       '#fcfbf8' )
punk_floss.save( "./tmp/punk_floss.png" )


puts "bye"

