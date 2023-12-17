

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
   'maxibiz',
   'black',
   'default',
   'albino',
   'brown',
   'dark',
   'demon',
   'golden',
   'golden-block',
   'gray',
   'gray-block',
   'green',
   'memepool',
   'pepe',
   'alien',
   'deathbot',
   'safemode',
   'pink',
   'zombie',
  ],
   eyes: [
  '3dglasses',
  'eyes-alien',
  'eyes-big',
  'eyes-blend',
  'eyes-blue',
  'eyes-bored',
  'eyes-cool',
  'eyes-demon',
  'eyes-green',
  'eyes-left',
  'eyes-monobrow',
  'eyes-pepe',
  'eyes-polarized',
  'eyes-rainbow',
  'eyes-red',
  'eyes-zombie',
  'lasereyes-blue',
  'lasereyes-gold',
  'lasereyes-green',
  'lasereyes-red',
  'vr',
  'eyes-left-blue',
  'eyes-big-blue',
  'maxibiz-lasereyes-red',
  'maxibiz-lasereyes-green',
  'maxibiz-lasereyes-blue',
   ],
   accessories: [
  'bandana',
  'bandana2',
  'cowboyhat',
  'headband',
  'knittedcap',
  'knittedcap2',
  'tophat',
  'cap',
  'cap-mcb',
  'cap-mcd-red',
  'cap-mcd-white',
  'cap-mcd-black',
  'cap-burgerking',
  'cap-subway',
  'crown',
  'halo',
   ],
   hair: [
      'mohawk',
      'mohawk-blonde',
      'mohawk-purple',
      'mohawk-red',
      'mohawk2',
      'mohawk2-green',
      'mohawk2-pink',
      'mohawk2-red',
      'peakspike',
      'peakspike-blonde',
      'peakspike-purple',
      'peakspike-red',
      'wildhair',
      'wildhair-blonde',
      'wildhair-red',
      'wildhair-white',
      'bob-blonde',
   ],
}.reduce( {} ) do |h,(category, names)| 
     names.each do |name|
        key = File.basename( name ).downcase.gsub( /[^a-z0-9]/, '' )

        ##  fix-up names by category 
        key = "bg#{key}"    if category == :backgrounds

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



