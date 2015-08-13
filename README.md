# Mr. Hyde's Scripts - Add Your Script!


### Mini Language


#### say( text )

    say( "Welcome" )

#### ask(question, [default])

    title = ask( "What do you want to call your site?" )

#### yes?(question, [default]) or no?(question, [default])

    puts "yes, sir"   if yes?( "Add analytics?" )

#### select( question, choices, [default] )

    theme = select( "Select your theme", ["Starter", "Bootstrap", "Minimal"] )


todo: use alternative names for select ?? e.g. choice, pick, ??
todo: return index (key) e.g. 1 or return string (value) e.g. "Starter" or both [1, "Starter" ]??



#### theme( key | title )

download and setup (unzip/unpack) theme

    theme( 'starter' )


#### config block

update _config.yml settings

    config do |c|
      c.title        = "Your Site Title"
      c.author.name  = "Your Name"
      c.author.email = "henry@example.com"
      
      c.mrhyde.title        = title
      c.mrhyde.last_updated = Time.now
    end



## Meta


**Questions? Comments?**

Post them to the [wwwmake forum](http://groups.google.com/group/wwwmake). Thanks!

