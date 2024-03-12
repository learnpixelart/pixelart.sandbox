

ATTRIBUTES = {
   base: [
      'rock_safemode',
      'rock_memepool',
      'rock_pepe',
      'rock_pink',
      'rock_alien',
      'rock_golden',
      'rock_golden_block',
      'rock_1bit',
      'rock_1bit_block',
  ],
  accessories: [
   'bandana',
   'bandana2',
   'cap',
   'cap_mcb',
   'tophat',
   'headband',
 ], 
 eyes: [
   'lasereyes_red',
   '3dglasses',
   'eyes_polarized',
   'eyes_rainbow',
   'regular_shades',
 ],
 hair: [
   'mohawk_blonde',
   'mohawk_purple',
   'mohawk_red',
   'mohawk_pink',
 ]
}.reduce( {} ) do |h,(category, names)| 
     names.each do |name|
        key = File.basename( name ).downcase.gsub( /[^a-z0-9]/, '' )

        ## fix-up file path by category
        path =  category == :base ? name : "#{category}/#{name}"

        puts "  #{key} / #{category}"
        if h.has_key?( key )
          puts "!! ERROR - duplicate key >#{key}<; already in use; sorry"
          exit 1
        end

        h[ key ] = Image.read( "./attributes/#{path}.png" )
     end
     h
end




def generate( *attributes )
   base = Image.new( 28,28 )
   attributes.each do |attrib|
        key = attrib.downcase.gsub( /[^a-z0-9]/, '' )
        img = ATTRIBUTES[ key ]
        if img.nil?
           puts "!! #{attrib} with key #{key} not found; sorry"
           exit 1
        end
        base.compose!( img )
   end
   base
end



