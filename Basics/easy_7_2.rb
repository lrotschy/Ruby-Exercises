# easy_7_2.rb
# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

input: a string
output: a hash where key are lowercase, uppercase, neither, and values are the number of characters of each type

create hash with keys
call count on string and pass in lower case letters
  set value of lowercase to result
repeat for uppercase
pass to neither the result of string.length - (lower and upper)
return the hash

def letter_case_count(string)
  lowercase = string.count('aeiou')
  uppercase = string.count('AEIOU')
  neither = string.length - (lowercase + uppercase)
  hash = {
    lowercase: lowercase,
    uppercase: uppercase,
    neither: neither
  }
end



letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
