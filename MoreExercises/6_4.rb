# 6_4.rb

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

def dot_separated_ip_address?(input_string)

    dot_separated_words = input_string.split(".")
    return false if dot_separated_words.size != 4

  while dot_separated_words.size > 0
    if is_an_ip_number?(dot_separated_words.pop)
      next
    else
      false
    end
   true
  end

end


# refactored to be more concise

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
    while dot_separated_words.size > 0 do
      false unless is_an_ip_number?(dot_separated_words.pop)
    end
  true
end
