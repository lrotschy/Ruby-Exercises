a = 'strong'
b = 'strong'
p a.object_id
p b.object_id

def whereuat?(variable)
  p variable.object_id
end

whereuat?(a)
whereuat?(b)

a = 'stronger'
p a.object_id

def whereuat2?(variable)
  p 'in the method before upcase'
  p variable
  p variable.object_id
  p 'in the method after upcase'
  p variable.upcase.object_id # this one has a different object id. all the others have the same. but it doesn't have a different id when it is upcase!
  p variable
  p variable.object_id
end

str = "anybody home? "
p "Before the method"
p str
p str.object_id
p 'after the method'
p whereuat2?(str)
p 'after the method'
p str
p str.object_id

def immutables(n)
  p 'in the method before addition'
  p n
  p n.object_id
  p 'in the method during addition'
  p (n + 5).object_id
  p n
  p n.object_id
  p 'in the method after addition'
  p n
end

x = 1
p 'outside the method before'
p x
p x.object_id
immutables(x)
p 'outside the method after'
p x
p x.object_id
