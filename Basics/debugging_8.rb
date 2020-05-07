
def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  new_password
end

def verify_password(pass)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == pass
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

password = nil

if !password
  password = set_password
end

verify_password(password)
