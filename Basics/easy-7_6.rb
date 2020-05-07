# easy_7_5.rb
# modify previous exercise so that the toggle from upcase to downcase ignores non alphabetic characters
#
# input: a string
# output: a string with alternating alphabetic characters upcased/downcased. non-alphabetic characters are included, but not counted when upcasing or downcasing.
#
# set toggle to true
# create empty string
# string to array of characters.each
#   if alphabet include? char, and toggle == true,
#     string << char.upcase
#     toggle = false
#   elsif alphabet include? char and toggle == false
#     string << char.downcase
#     toggle = true
#   else
#     string << char
#   end
# end
# new string



# def staggered_case(string)
#   new_string = ''
#   toggle = true
#   string.chars.each do |ch|
#     if ('A'..'z').include?(ch) && toggle == true
#       new_string << ch.upcase
#       toggle = false
#     elsif ('A'..'z').include?(ch) && toggle == false
#       new_string << ch.downcase
#       toggle = true
#     else
#       new_string << ch
#     end
#   end
#   new_string
# end
#
#
# def staggered_case(string)
#   new_string = ''
#   toggle = true
#   string.chars.each do |ch|
#     if ('A'..'z').include?(ch)
#       toggle == true ? new_string << ch.upcase : new_string << ch.downcase
#       toggle = !toggle
#     else
#       new_string << ch
#     end
#   end
#   new_string
# end
#
# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

def staggered_case(string, ignore_other = true)
  new_string = ''
  toggle = true
  string.chars.each do |ch|
    if ignore_other == true
      if ('A'..'z').include?(ch)
        toggle == true ? new_string << ch.upcase : new_string << ch.downcase
        toggle = !toggle
      else
        new_string << ch
      end
    elsif ignore_other == false
      toggle == true ? new_string << ch.upcase : new_string << ch.downcase
      toggle = !toggle
    end
  end
  new_string
end

p staggered_case('I Love Launch School!', true) == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS', true) == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 nUmBeRs'
p staggered_case('I Love Launch School!', false) #== 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS', false) #== 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers', false) #== 'IgNoRe 77 ThE 444 nUmBeRs'
