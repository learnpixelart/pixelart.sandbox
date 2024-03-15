

ATTRIBUTES = {
   backgrounds: [ 
      # solid colors 
       'aqua',
       'blue',
       'green',
       'red',
       'yellow',
       'bitcoin-orange',
       'classic',
       'default',  
     # currency patterns
         'bitcoin-pattern',
         'dollar-pattern',
         'euro-pattern',
     # flags and more
         'rainbow',
         'ukraine',
         'usa',
         'austria',
         'great-britain',
         'china',
         'europe',
   ],
   base: [
      'nick',
      'nick-ii',
      'nick-iii',
      'nick-gold',
      'nick-ii-gold',
      'joe',
      'joe-gold',
      'donald',
      'donald-gold',
    ],
    mouth: [
      'mouth', # standard
      'smile', 
      'smile-big',
    ],
    hair: [
      'hair1',
      'hair2',
      'short-hair',
    ],
   accessories: [
      'coolshades-blue',
      'coolshades-green',
      'coolshades-red',
   ],
}.reduce( {} ) do |h,(category, names)| 
     names.each do |name|
        key = File.basename( name ).downcase.gsub( /[^a-z0-9]/, '' )

       ## add category or fix-up names 
       key = "bg#{key}"    if category == :backgrounds

        puts "  #{key} / #{category}"
        if h.has_key?( key )
          puts "!! ERROR - duplicate key >#{key}<; already in use; sorry"
          exit 1
        end

        ## fix-up file path by category
        path =  category == :base ? name : "#{category}/#{name}"

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
           pp ATTRIBUTES.keys
           exit 1
        end
        base.compose!( img )
   end
   base
end



