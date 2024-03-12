

ATTRIBUTES = {
   base: [
    'alien',
    'brown',
    'golden',
    'greener',
    'greener-orc',
    'orange-orc',
    'black',
    'default',
    'gray',  # small type
    'pink',  # small type
    'deathbot',
    'pepe',
    'pepe-block',
   ],
   accessories: [
    'crown',
    'bandana',
    'bandana2',
    'cap',
    'cap-ordinal',
    'cap-terminal',
    'cap-terminal2',
    'cap-mcb',
    'cap-army',
    'cap-safemode',
    'cowboyhat',
    'fez',
    'flathat',
    'frenchcap',
    'halo',
    'knittedcap',
    'knittedcap2',
    'wizardhat',
   ],
    eyes: [
      'eyes-left',
      'eyes-right',
      'eyes-zombie',
      'eyes-deathbot',
      'eyes-bot-green',
      'eyes-bot',
      'eyes-big',
      'eyes-bored',
      'eyes-monobrow',
      'eyes-pepe',
      'lasereyes-red',
      '3dglasses',
      'shades-polarized',
      'shades-blend',
   ],
   hair: [
      'mohawk',
      'mohawk-blonde',
      'mohawk-purple',
      'mohawk-red',
      'mohawk-pink',
   ],
   hoodies: [
     'hoodie',
     'hoodie-green',
     'hoodie-greener',
     'hoodie-orange',
     'hoodie-pink',
     'hoodie-red',
     'hoodie-purple',
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

        ## fix-up file path by category
        path =  category == :base ? name : "#{category}/#{name}"

        h[ key ] = Image.read( "./attributes/#{path}.png" )
     end
     h
end




def generate( *attributes )
   base = Image.new( 12,12 )
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



