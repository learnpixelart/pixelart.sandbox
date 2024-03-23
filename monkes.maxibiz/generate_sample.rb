require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
    maxibiz
    maxibiz, lasereyes red
    maxibiz, lasereyes green
    maxibiz, lasereyes blue
    maxibiz, lasereyes orange
    maxibiz, lasereyes 2 red
    maxibiz, lasereyes 2 green
    maxibiz, lasereyes 2 blue
    maxibiz, lasereyes 2 orange
    maxibiz, 3d glasses
    maxibiz, eyes monobrow
    maxibiz, bubblegum
    maxibiz, bandana
    maxibiz, cap mcb
    maxibiz, cap ordinal
    maxibiz, cap terminal
    maxibiz, cowboyhat
    maxibiz, flathat
    maxibiz, knittedcap
    maxibiz, hoodie
    maxibiz, hoodie, 3d glasses
    maxibiz, hoodie, eyes monobrow
    maxibiz, cap mcb, 3d glasses
    maxibiz, cap mcb, eyes monobrow
    maxibiz, hoodie, lasereyes red
    maxibiz, hoodie, lasereyes green
    maxibiz, hoodie, lasereyes blue
    maxibiz, hoodie, lasereyes orange
    maxibiz, hoodie, lasereyes 2 orange

    maxibiz, hoodie orange
    maxibiz, hoodie orange, 3d glasses
    maxibiz, hoodie orange, eyes monobrow

DATA


types = [
  'maxibiz',
  'maxibiz2',
  'maxibiz3',
  'maxibiz4',
  'maxibiz5',
  'maxibiz6',
]


types.each do |type|

  cols = 6
  rows = specs.size / cols 
  rows += 1    if specs.size % cols != 0

 composite = ImageComposite.new( cols, rows, 
                                   width: 28, height: 28 )

  specs.each_with_index do |spec, i|
       
     attribs = ['background white', type ]
     attribs+= spec[1..-1]

       img = generate( *attribs )
       img.save( "./tmp/#{type}-#{i}.png" )
     img.zoom(10).save( "./tmp/#{type}-#{i}@10x.png" )
     composite << img

  end


  composite.save( "./tmp2/#{type}.png" )
  composite.zoom(4).save( "./tmp2/#{type}@4x.png" )
end

puts "bye"
