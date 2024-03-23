

ATTRIBUTES = {
   backgrounds: [ 
         # solid colors 
          'bitcoin-orange',
          'black',
          'white', 
        # currency patterns
            'bitcoin-pattern',
   ],
  base: [
   'maxibiz',
   'maxibiz2',
   'maxibiz3',
   'maxibiz4',
   'maxibiz5',
   'maxibiz6',
   'maxibiz-punk',
   'maxibiz-punk2',
  ],
  eyes: [
   '3dglasses',
   'eyes-monobrow',
   'lasereyes-blue',
   'lasereyes-green',
   'lasereyes-red',
   'lasereyes-orange',
   'lasereyes2-blue',
   'lasereyes2-green',
   'lasereyes2-red',
   'lasereyes2-orange',
  ],
  head: [
   'bandana',
   'bandana-ii',
   'cap-mcb',
   'cap-mcd',
   'cap-ordinal',
   'cap-terminal',
   'cowboyhat',
   'tophat',
   'tophat-ii',
   'knittedcap',
   'crown',
   'crown-ii',
   'cap-ii',
   'cap-iia',
   'frenchcap',
   'wizardhat',
   'wizardhat-ii',
   'wizardhat-iia',
  ],
  hair: [
   'mohawk',
   'mohawk-ii',
   'mohawk2',
   'mohawk2-ii',
   'peakspike',
   'bob',
  ],
  more: [
   'bubblegum',
   'hoodie',
   'hoodie-ii',
   'hoodie-orange',
  ],
}.reduce( {} ) do |h,(category, names)| 
     names.each do |name|
        key = File.basename( name ).downcase.gsub( /[^a-z0-9]/, '' )

        ## add category or fix-up names 
        key = "background#{key}"    if category == :backgrounds

        puts "  #{key} / #{category}"
        if h.has_key?( key )
          puts "!! ERROR - duplicate key >#{key}<; already in use; sorry"
          exit 1
        end

        path = if category == :base 
                  "#{name}.png"
               else
                  "#{category}/#{name}.png"
               end

        h[ key ] = Image.read( "./attributes/#{path}" )
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



