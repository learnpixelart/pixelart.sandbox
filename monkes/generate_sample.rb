require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
 ## archetypes
   dark-small
   medium-small
   light-small
   albino-small
   gray-small
   green-small
   pink-small
   purple-small
   brown, eyes-left
   gray, eyes-left
   green, eyes-left
   pink, eyes-left
   purple, eyes-left
   red, eyes-left
   white, eyes-left

   background usa, pink-small, earring 
   background usa, pink, eyes-left, earring cross
   background usa, pink-small, eyes-blue-small, hoodie pink
   background usa, red, eyes-left, mohawk
   background usa, demon, eyes-demon, hoodie ruby, halo
   
   background great britain, red, eyes-left, mohawk
   background great britain, greener orc, eyemask, earring cross, mohawk
   background china, red, eyes-left, mohawk
   background europe, red, eyes-left, mohawk
   background austria, red, eyes-left, mohawk

   background aqua, pink-small, eyes-blue-small, bob-blonde-small
   background rainbow, pink-small, eyes-big, eyes-blue-big, bob-red-small
   background ukraine, pink-small, eyes-left, eyes-blue,  bob-small
   background bitcoin pattern, pink-small, bob-blonde-small, lasereyes-blue
 
   background bitcoin pattern, orange orc, mohawk red, lasereyes-red
   background bitcoin pattern, orange orc, hoodie orange, lasereyes-red
   background bitcoin pattern, orange orc, wizardhat orange, lasereyes-red
   background dollar pattern, greener orc, mohawk green, eyemask
   background dollar pattern, greener orc, hoodie green, eyemask
   background dollar pattern, greener orc, eyes-bot-green, wizardhat green

   background euro pattern, blue orc, eyes-left, mohawk purple
   background euro pattern, blue orc, eyes-left, hoodie midnight
   background euro pattern, blue orc, eyes-bot, wizardhat midnight
   squiggle, eyes-left
   punk, lasereyes-punk

   alien, eyes-alien, headband
   boned, eyes-left
   bot, eyes-bot
   deathbot, eyes-deathbot
   demon, eyes-demon
   golden, eyes-left
   hyena, eyes-left
   mempool, eyes-left
   pepe, eyes-pepe
   pepe-block, eyes-pepe
   rainbow, eyes-left
   safemode, eyes-left
   zombie, eyes-zombie

   alien, eyes-alien, cap mcd red
   boned, eyes-left, cap mcd black
   bot, eyes-bot,   cap mcd white
   deathbot, eyes-deathbot, cap subway
   demon, eyes-demon,   cap mcb
   golden, eyes-left,  cap mcb
   hyena, eyes-left,   cap burgerking
   mempool, eyes-left,  cap mcd red
   pepe, eyes-pepe,    cap mcd red
   pepe-block, eyes-pepe, cap mcd black
   rainbow, eyes-left,  cap mcd white
   safemode, eyes-left,   cap subway
   zombie, eyes-zombie,  cap burgerking


   brown, eyes-left, beanie, bubblegum
   brown, eyes-left, jesterhat, bubblegum
   gray, eyes-left, helmet
   green, eyes-left, helmet2
   pink, eyes-left, beanie
   purple, eyes-left, hoodie
   red, eyes-left, cap captain
   white, eyes-left, hoodie, bubblegum


   albino-small,  bandana
    brown, eyes-left,   bandana2
     dark-small, bowler
     gray-small,  helmet
     gray, eyes-left,   cap-army
     green-small, cap-mcb
     green, eyes-left, cap-ordinal
     light-small, cap-safemode
     medium-small,   cap-terminal
     pink-small,  cap-terminal2
     pink, eyes-left,  cap
     purple-small, cowboyhat
     purple, eyes-left,  crown,  earring
     demon, eyes-demon, halo
     red, eyes-left, flathat
     white, eyes-left, frenchcap    

     albino-small,     fez
     brown, eyes-left,     knittedcap
      dark-small,  knittedcap2
      gray-small,  policecap
      gray, eyes-left,  wizardhat  
      green-small, wizardhat
      green, eyes-left, flathat
      light-small, tophat
      medium-small, tophat
      pink-small, flathat
      pepe-block, eyes-pepe, tophat
      pepe-block, eyes-pepe, flathat
      pink, eyes-left, wizardhat
       purple-small, wizardhat-blue
      purple, eyes-left, wizardhat-orange
      demon, eyes-demon, wizardhat-red
      red, eyes-left,  wizardhat-blue
      white, eyes-left, wizardhat-orange


      dark-small, 3dglasses
      medium-small, shades-blend
      light-small, shades-rainbow
      light-small, shades-polarized
      light-small, shades-cool
      albino-small, eyepatch
      gray-small, eyes-big
      green-small, eyes-bot-green
      pink-small, eyes-bored
      purple-small, eyes-bot
      demon, eyes-deathbot
      brown, eyes-zombie
      gray, eyes-right
      green, eyes-pepe
      pink,  eyes-monobrow
      purple, eyemask
      red, lasereyes-gold
      white, shades-rainbow


      dark-small, hoodie
      medium-small, hoodie midnight
      light-small, hoodie indigo
      albino-small, hoodie blue
      gray-small, hoodie cobalt
      green-small, hoodie aqua
      pink-small, hoodie green
      purple-small, hoodie greener 
      brown, eyes-left, hoodie limegreen
      gray, eyes-left, hoodie gold
      green, eyes-left, hoodie orange
      pink, eyes-left, hoodie ruby
      purple, eyes-left, hoodie red
      red, eyes-left, hoodie purple
      white, eyes-left, hoodie pink
      white, eyes-left, hoodie, bubblegum
   
      gray-small, tophat
      green-small, tophat-midnight
      pink-small, wizardhat-blue
      purple-small, wizardhat-orange
      brown, eyes-left, wizardhat-red
      gray, eyes-left, wizardhat-dark
      green, eyes-left, wizardhat-gray
      pink, eyes-left, wizardhat-midnight
      purple, eyes-left, wizardhat-gold
      red, eyes-left, wizardhat-green
      white, eyes-left, wizardhat-white

      dark-small, vr
      medium-small, vr
      light-small, vr
      albino-small, vr
      bot, eyes-bot, vr
      zombie, eyes-zombie, vr
      pink-small, vr, hoodie pink
      purple-small, vr
      brown, eyes-left, vr
      gray, eyes-left, vr
      green, eyes-left, vr, hoodie green
      pink, eyes-left, vr, earring
      purple, eyes-left, vr, earring cross
      red, eyes-left, hoodie ruby, vr
      white, eyes-left, vr, bubblegum

      dark-small, shades cool, peakspike
      medium-small, shades polarized, peakspike purple
      light-small, shades rainbow, peakspike red
      albino-small, shades blend, peakspike blonde

      dark-small, shades cool, mohawk2
      medium-small, shades polarized, mohawk2 blonde
      light-small, shades rainbow, mohawk2 green
      albino-small, shades blend, mohawk2 purple

      purple, shades cool, mohawk2 red
      red, shades polarized, mohawk2 orange
      white, shades blend, mohawk2 pink, bubblegum

      black
      background default, default
      black,   shades cool
      background default, default, 3d glasses
      background default, default, shades polarized
      background default, default, knitted cap

      background bitcoin orange, maxibiz
      background bitcoin orange, maxibiz2
      background bitcoin orange, maxibiz3
      background bitcoin orange, maxibiz4
      background bitcoin orange, maxibiz5
      background bitcoin orange, maxibiz6
      background bitcoin orange, maxibiz-punk
      background bitcoin orange, maxibiz-punk2
    
      background bitcoin orange, maxibiz,   maxibiz lasereyes red
      background bitcoin orange, maxibiz2,   maxibiz lasereyes green
      background bitcoin orange, maxibiz3,   maxibiz lasereyes blue
      background bitcoin orange, maxibiz4, cap mcb 1bit,   maxibiz lasereyes2 red
      background bitcoin orange, maxibiz5,   maxibiz lasereyes2 green
      background bitcoin orange, maxibiz6, cap ordinal 1bit,  maxibiz lasereyes2 blue
      background bitcoin orange, maxibiz-punk,  mohawk, maxibiz lasereyes red
      background bitcoin orange, maxibiz-punk2, mohawk2,  maxibiz lasereyes blue
DATA




cols = 10
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 28, height: 28 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp/monke#{i}.png" )
     img.zoom(10).save( "./tmp/monke#{i}@10x.png" )
     composite << img

end


composite.save( "./tmp/monkes.png" )
composite.zoom(4).save( "./tmp/monkes@4x.png" )


puts "bye"
