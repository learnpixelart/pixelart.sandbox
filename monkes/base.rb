

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
          'black',
          'white', 
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
   classic: [
     'albino-small',
     'brown',
     'dark-small',
     'gray-small',
     'gray',
     'green-small',
     'green',
     'light-small',
     'medium-small',
     'pink-small',
     'pink',
     'purple-small',
     'purple',
     'red',
     'white',
   ],
   'classic-specials': [
       'alien',
       'boned',
       'bot',
       'deathbot',
       'demon',
       'golden',
       'hyena',
       'mempool',
       'pepe-block',
       'pepe',
       'rainbow',
       'safemode',
       'zombie',
    ],
   'classic-eyes': [
      '3dglasses',
      'shades-blend',
      'shades-rainbow',
      'eyepatch',
      'eyes-big',
      'eyes-bored',
      'eyes-bot',
      'eyes-bot-green',
      'eyes-deathbot',
      'eyes-left',
      'eyes-monobrow',
      'eyes-pepe',
      'eyes-right',
      'eyes-zombie',
   ],
   'classic-accessories': [
      'bandana',
      'bandana2',
      'bowler',
      'cap-army',
      'cap-mcb',
      'cap-ordinal',
      'cap-safemode',
      'cap-terminal',
      'cap-terminal2',
      'cap-captain',
      'cap',
      'cowboyhat',
      'crown',
      'earring',
      'earring-cross',
      'fez',
      'flathat',
      'frenchcap',
      'halo',
      'knittedcap',
      'knittedcap2',
      'policecap',
      'wizardhat',  
    ],
   'more-eyes': [
      'eyemask',
      'eyes-blue',
      'eyes-blue-small',
      'eyes-blue-big',
      'eyes-alien',
      'eyes-demon',
      'lasereyes-red',
      'lasereyes-red_(bmp)',
      'lasereyes-red-maxi_(bmp)',
      'lasereyes-red-up_(bmp)',
      'lasereyes-red-down_(bmp)',
      'lasereyes-red-updown_(bmp)',
      'lasereyes-red-downup_(bmp)',
      'lasereyes-red-leftright_(bmp)',
      'lasereyes-blue',
      'lasereyes-green',
      'lasereyes-gold',
      'lasereyes-punk',
      'vr',
      'shades-polarized',
      'shades-cool',
   ],
   hoodies: [
      'hoodie',
      'hoodie-midnight',
      'hoodie-indigo',
      'hoodie-blue',
      'hoodie-cobalt',
      'hoodie-aqua',
      'hoodie-green',
      'hoodie-greener',
      'hoodie-limegreen',
      'hoodie-gold',
      'hoodie-orange',
      'hoodie-ruby',
      'hoodie-red',
      'hoodie-purple',
      'hoodie-pink',
   ], 
   hair: [
       'bob',
       'bob-small',
       'bob-blonde',
       'bob-blonde-small',
       'bob-red',
       'bob-red-small',
       'mohawk',
       'mohawk-blonde',
       'mohawk-green',
       'mohawk-purple',
       'mohawk-red',
       'mohawk2',
       'mohawk2-blonde',
       'mohawk2-green',
       'mohawk2-purple',
       'mohawk2-red',
       'mohawk2-orange',
       'mohawk2-pink',
       'peakspike',
       'peakspike-purple',
       'peakspike-red',
       'peakspike-blonde',
   ],
   more: [
      'blue-orc',
      'blue',
      'gold-orc',
      'gold',
      'greener-orc',
      'greener',
      'orange-orc',
      'orange',
      'orange2-orc',
      'orange2',
      'punk',
      'squiggle',
      'black',
      'default',
      'bitmap',
      'bitmapii',
      'bitmap2',
      'bitmap2ii',
      'bitmap3',
      'bitmap3ii',
  ],
  'more-accessories': [
       'bubblegum',
       'beanie',
       'cap-burgerking',
       'cap-mcd-black',
       'cap-mcd-red',
       'cap-mcd-white',
       'cap-subway',
       'jesterhat',   
       'helmet',  
       'helmet2',  
       'tophat',
       'tophat-midnight',
       'wizardhat-blue',
       'wizardhat-orange',
       'wizardhat-red',
       'wizardhat-dark',
       'wizardhat-gray',
       'wizardhat-midnight',
       'wizardhat-gold',
       'wizardhat-green',
       'wizardhat-white',
       'headband',
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

        h[ key ] = Image.read( "./attributes/#{category}/#{name}.png" )
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



