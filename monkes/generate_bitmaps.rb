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
DATA

=begin
    bitmap, lasereyes red
    bitmap, lasereyes blue
    bitmap, lasereyes gold
 
    bitmap, eyes right, hoodie
    bitmap, eyes right, hoodie orange
    bitmap, shades polarized

    bitmap, bob blonde small
    bitmap, eyes bot, earring cross
    bitmap, 3d glasses
    bitmap, cap safemode
    bitmap, cap terminal 2
=end


types = [
  'bitmap',
  'bitmapii',
  'bitmap2',
  'bitmap2ii',
  'bitmap3',
  'bitmap3ii'
]


types.each do |type|

  cols = 4
  rows = specs.size / cols 
  rows += 1    if specs.size % cols != 0

 composite = ImageComposite.new( cols, rows, 
                                   width: 28, height: 28 )

  specs.each_with_index do |spec, i|
       
     attribs = ['background black', type ]
     attribs+= spec[1..-1]

       img = generate( *attribs )
       img.save( "./tmp/#{type}#{i}.png" )
     img.zoom(10).save( "./tmp/#{type}#{i}@10x.png" )
     composite << img

  end


  composite.save( "./tmp/#{type}.png" )
  composite.zoom(4).save( "./tmp/#{type}@4x.png" )
end

puts "bye"
