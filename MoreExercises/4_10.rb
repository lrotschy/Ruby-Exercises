# 4_10.rb

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

#foo = yes
#bar(yes) = no

p bar(foo)
