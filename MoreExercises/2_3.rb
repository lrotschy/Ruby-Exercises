# 2_3.rb

advice = "Few things in life are as important as house training your pet."

advice_array = advice.split
advice_array[6] = "urgent"
advice = advice_array.join(' ')
puts advice

# lol: advice.gsub!('important', 'urgent')

more_advice = "You should definitely look for existing methods to simplify tasks."
more_advice.gsub!('definitely', 'always')
puts more_advice

question = "Can you use gsub! to remove unwanted parts of a string, like in that cool method I wrote to remove commas from numbers?"
question.gsub!(' ', '')
puts question
#Yes, you can!

number_string = '127,000'
number_string.gsub!(',', '')
puts number_string

another_question = 'Can you add things to strings with gsub?'
another_question.gsub!(' ', ', ')
puts another_question << '...but why?'
