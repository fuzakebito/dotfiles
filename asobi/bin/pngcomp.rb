#!/usr/bin/ruby
f = ARGV[0].chomp
f2 = `echo "#{ARGV[0]}" | sed 's/\.[^\.]*$//'`.chomp
f3 = "#{f2}-fs8.png"
f4 = "#{f2}-comp.png"
`rm #{f3}`
`rm #{f4}`
`pngquant --floyd=1 --speed=1 --quality=0-97 #{f}`
`zopflipng -m --lossy_transparent --lossy_8bit --filters=0me #{f3} #{f4}`
`rm #{f3}`
