
# encoding: utf-8

###############################################
# Mr. Hyde's Quick Start Static Site Script

say "Welcome, before setting up your site Mr. Hyde will ask you some questions."

title = ask "What's your site's title", "Sz Flex Theme"

name  = ask "What's your name", "StartZeroGnu"

say "Thanks! Ready-to-go. Stand back."

install_theme "SZ-Flex (Blog)"

config do |c|
  c.title        = title
  c.author.name  = name

  c.mrhyde.last_updated = Time.now
  c.mrhyde.title        = title
  c.mrhyde.name         = name
end

say "Done."
