#####
#  to run use:
#    $   ruby ./bronzecoins.rb



require 'pixelart'




puts "colors:"
puts Color.format( Color.parse(  '#B16C57' ))
#=>

# note: use dark to light
COIN_PALETTE = Gradient.new( '#7C433A',
                             '#8D5144',
                             '#B16C57',
                             '#C87E63',
                             '#E99775' ).colors( 256 )


img = ImagePalette8bit.new( COIN_PALETTE, size: 4 )
img.save( "./tmp/palette_bronze.png" )
img.zoom(2).save( "tmp/palette_bronzex2.png" )


COIN_FRAME   = Image.read( "./bronzecoin-34x34.png" )
COIN_FRAME_FRONT   = Image.read( "./bronzecoin-34x34-front.png" )
COIN_FRAME_BACK    = Image.read( "./bronzecoin-34x34-back.png" )

puts "   #{COIN_FRAME.width}x#{COIN_FRAME.height}"


def mint( monke )
  ## change to coin color palette
  coin = Image.new( 34, 34 )
  # coin.compose!( COIN_FRAME )
  coin.compose!( COIN_FRAME_BACK )
  coin.compose!( monke.change_palette8bit( COIN_PALETTE ), 3, 1 )
  coin.compose!( COIN_FRAME_FRONT )
  coin
end




###
#  generate (preview strips)

composite = ImageComposite.new( 7, 3, width:  34+4,
                                      height: 34+4 )


ids = (0..20)
pp ids

ids.each do |id|

  monke = Image.read( "./iii/monke#{id}.png")
  coin = mint( monke )


  coin.save( "./tmp4/penny#{id}.png" )
  coin.zoom(8).save( "./tmp4/@8x/penny#{id}@8x.png" )


  tile = Image.new( 34+4, 34+4 )
  tile.compose!( coin, 2, 2 )  ## add 2/2 padding
  composite << tile
end


composite.save( "./tmp/pennies.png" )
composite.zoom(2).save( "./tmp/pennies@2x.png" )
composite.zoom(4).save( "./tmp/pennies@4x.png" )


puts "bye"
