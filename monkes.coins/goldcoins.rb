#####
#  to run use:
#    $   ruby ./goldcoins.rb



require 'pixelart'




puts "colors:"
puts Color.format( Color.parse(  '#f2af39' ))
#=> #f2af39 / rgb(242 175  57) - hsl( 38°  88%  59%) - hsv( 38°  76%  95%)


# note: use dark to light
COIN_PALETTE = Gradient.new( '#CA7128',
                             '#D9862C',
                             '#F2AF39',
                             '#F6C451',
                             '#FBE272' ).colors( 256 )


img = ImagePalette8bit.new( COIN_PALETTE, size: 4 )
img.save( "./tmp/palette_gold.png" )
img.zoom(2).save( "tmp/palette_goldx2.png" )


COIN_FRAME   = Image.read( "./goldcoin-34x34.png" )
COIN_FRAME_FRONT   = Image.read( "./goldcoin-34x34-front.png" )
COIN_FRAME_BACK    = Image.read( "./goldcoin-34x34-back.png" )

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

  monke = Image.read( "./i/monke#{id}.png")
  coin = mint( monke )


  coin.save( "./tmp2/goldcoin#{id}.png" )
  coin.zoom(4).save( "./tmp2/@4x/goldcoin#{id}@4x.png" )


  tile = Image.new( 34+4, 34+4 )
  tile.compose!( coin, 2, 2 )  ## add 2/2 padding
  composite << tile
end


composite.save( "./tmp/goldcoins.png" )
composite.zoom(2).save( "./tmp/goldcoins@2x.png" )
composite.zoom(4).save( "./tmp/goldcoins@4x.png" )


puts "bye"
