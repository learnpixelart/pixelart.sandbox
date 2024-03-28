#####
#  to run use:
#    $   ruby ./goldcoins_more.rb



require 'pixelart'


# note: use dark to light
COIN_PALETTE = Gradient.new( '#CA7128',
                             '#D9862C',
                             '#F2AF39',
                             '#F6C451',
                             '#FBE272' ).colors( 256 )


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







ids = (0..1)
pp ids

ids.each do |id|

  monke = Image.read( "./tmp/more/monke#{id}.png")
  coin = mint( monke )

  coin.save( "./tmp5/goldcoin#{id}.png" )
  coin.zoom(8).save( "./tmp5/@8x/goldcoin#{id}@8x.png" )
end



puts "bye"
