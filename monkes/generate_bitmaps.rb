require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
    bitmap
    bitmap, lasereyes red (bmp)
    bitmap, lasereyes red up (bmp)
    bitmap, lasereyes red down (bmp)
    bitmap, lasereyes red left right (bmp)
    bitmap, lasereyes red up down (bmp)
    bitmap, lasereyes red down up (bmp)
    bitmap, lasereyes red maxi (bmp)
 
    bitmap, mohawk  red
    bitmap, peakspike red, eyes monobrow
    bitmap, eyes big
    bitmap, cap mcb
    bitmap, mohawk red, lasereyes red (bmp)
    bitmap, cap mcb, lasereyes red (bmp)
    bitmap, mohawk red, lasereyes red maxi (bmp)
    bitmap, cap mcb, lasereyes red down (bmp)

    bitmap, cap mcd red
    bitmap, cap mcd red, lasereyes red (bmp)

    bitmap, knitted cap
    bitmap, knitted cap, eyes big
    bitmap, knitted cap, lasereyes red (bmp)
DATA



types = [
  'bitmap',
  'bitmap2',
]


types.each do |type|
  cols = 7
  rows = specs.size / cols 
  rows += 1    if specs.size % cols != 0


 puts "==> #{type}..."

 composite = ImageComposite.new( cols, rows, 
                                   width: 28, height: 28 )

  specs.each_with_index do |spec, i|
       
     attribs  = ['background black', type ]
     attribs += spec[1..-1]

       num = '%02d' % i

       pp attribs
       img = generate( *attribs )
       img.save( "./ordzaar/#{type}#{num}.png" )
       img.zoom(10).save( "./ordzaar/@10x/#{type}#{num}@10x.png" )
     
       composite << img
  end


  composite.save( "./ordzaar/tmp/#{type}.png" )
  composite.zoom(2).save( "./ordzaar/tmp/#{type}@2x.png" )
  composite.zoom(4).save( "./ordzaar/tmp/#{type}@4x.png" )
  composite.zoom(6).save( "./ordzaar/tmp/#{type}@6x.png" )
end

puts "bye"
