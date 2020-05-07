# 2_2.rb

# ! is used as logical 'not' or to signify that a method is mutating.
# ? is used to signify that a method returns a boolean. It is also used in the ternary operator as part of Ruby syntax.

# 1. != is 'not equal'. You would use it in boolean statements like in conditionals or as break conditions for loops.

# 2. My original answer: I think !user_name would equal false.
# My updated answer: it turns the object into the opposite of its boolean value, which equals false in this case.

# 3. uniq! means that the method is mutating. It is a convention to use the ! this way.
a = [1, 2, 2, 3]
a.uniq!
puts a
#=> [1, 2, 3]

# 4. I don't know.
# My updated answer: I think of the use in the ternary operator as following the initial boolean. But I suppose you could see it as preceding the following statements, in which case it means something like 'if the preceding is true, do the first thing; if the preceding is false, do the second thing.'

# 5. Usually if ? is used at the end of the method it means that the method returns a boolean. This is also a convention.

[1, 2, 3].include?(4)
#=>false

# 6. My original answer: !! would be equivalent to 'not not', so it is basically meaningingless. Whatever follows evaluates to true.
# My updated answer: I was sort of right. It turns the object into its boolean value, which in this case would be true.
