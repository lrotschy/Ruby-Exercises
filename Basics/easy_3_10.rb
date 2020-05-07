# easy_3_10.rb

def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

p palindromic_number?(34543)
p palindromic_number?(123210)
p palindromic_number?(22)
p palindromic_number?(5)
p palindromic_number?(003300)
p palindromic_number?(003345)
p ''

def palindrome?(string)
  string = string.downcase.delete ("^a-z0-9")#"^a-z0-9"#"^a-z", "^0-9"
  string == string.reverse
end

def palindromic_number?(num)
  palindrome?(num.to_s)
end


p palindromic_number?(34543)
p palindromic_number?(123210)
p palindromic_number?(22)
p palindromic_number?(5)
p palindromic_number?(003300)
p palindromic_number?(003345)
