# debugging_2.rb

def shout_out_to(name)
  name2 = name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name2.join
end

shout_out_to('you') # expected: 'HEY YOU'
