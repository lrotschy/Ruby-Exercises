# 109 Study Guide Writing Practice 
1. local variable scope and how local variables interact with method invocations with blocks and method definitions

  Scope refers to the availability of local variables. Scope is created by method definition and with blocks. Local variables that are initialized in outer scope (i.e. not within a method definition or block) are available from inside blocks, but are invisible within methods. Local variables that are initialized inside a method definition are only accessible within the method. They are invisible from the outer scope. The only outer scope variables that are accesible within a method are those that are passed in as arguments. Local variables that are initialized inside a block are not available from outer scope.
  
  In the following example, the string 'dog' will be output. Because a is initialized in outer scope it is accessible inside the block argument to the `#times` method, so it can be reassigned.
  
  ``` ruby 
  a = 'cat'
  1.times { a = 'dog'}
  puts a
    ```
  
  However, if we do not initialize the variable in outer scope, it will not be accessible from outer scope:
  
   ``` ruby 
  1.times { a = 'dog'}
  puts a
  ```

This code will return an error message because the variable a is not accessible. 

  Methods work differently in some ways. This bit of code will output 'cat'. Because `a` is passed in as an argument to the method, its value can be reassigned within the method. 
  
  ``` ruby
a = 'dog'
def set_variable(string)
  string << "s are the best'"
end 
set_variable(a)
puts a
```
In the following code, we have a different result. `a` is initialized outside the method, and it is not passed in as an argument. On line 37 we initialize a new variable `a` and assign it the value 'dog'. This variable will not be available in outer scope because it was not initialized there and passed in as an argument. The program will output 'cat' because the variable initialized in line 35 is the only one available to it.
  ``` ruby
a = 'cat'
def set_variable(string)
  a = string
end 
set_variable('dog')
puts a
```

2. how passing an object into a method definition can or cannot permanently change the object
  Whether or not an object is permanently changed by passing it into a method depends on the nature of the object and the type of method. Some objects--numbers and booleans--are immutable. No method can change those objects, but variables that are assigned to them can be reassigned to other objects by the method. 
  ``` ruby 
a = 1 
a.object_id # => 3
def add(num)
  num + 1
end 
a = add(a)
puts a # => 2
puts a.object_id # => 5, different than above on line 48
```
If an object is mutable, it will be mutated if the method is destructive, otherwise it will remain unchanged.

``` ruby
a = 'string'
def add_to(str)
 str += 'y'
end 
add_to(a)
puts a # => 'string' because += is variable assignment; not mutating

b = 'string'
def add_to!(str)
  str << 'y'
end 
add_to!(b)
puts b # => 'stringy' because << is mutating

c = 'apple'
def up(string)
  string.upcase 
end 
up(c)
puts c # => 'apple' because #upcase is not mutating -- it does not change the object c is pointing to

def up!(string)
  string.upcase!
end 
up(c)
puts c # => 'APPLE' because #upcase! is mutating -- it changes the object c is pointing to
```

Variable assignment and reassignement is never mutating. A new object is created with the new value.
``` ruby 
a = 'string' 
a.object_id # => 70287287505420 
a += 'y' 
a.object_id # => 70287287486160
puts a # => 'stringy'
```

Indexed assignment is always mutating. The object_id of the collection will remain the same, even when the items within it are changed, deleted, or added to.
  
3. Working with collections and popular collection methods 
  - each
  - select
  - map
The `each` method is called on an array and takes a block argument. The method passes each element in the array into the block. It returns the original array, regardless of what actions were taken in each execution of the block.
``` ruby 
[1,2,3].each { |x| x + 1 }
# => [1, 2, 3]
```

The `map` method is similar to the `each` method except that it returns a new array with the same number of elements as the original. Each element is the return value of each iteration of the block. 
``` ruby 
[1,2,3].map { |x| x + 1 }
# => [2, 3, 4]]
```
``` ruby 
[1,2,3].map { |x| x > 10 }
# => [false, false, false]

The `select` method also returns a new array. This array holds only those elements of the original array for which the block execution returned a 'truthy' value.  
``` ruby 
[1,2,3].each { |x| x + 1 }
# => [1, 2, 3] # because x + 1 is not nil or false, it returns a truthy value
```
Here is a better example:
``` ruby 
[1,2,3].select { |x| x > 1 }
# => [2, 3] # only 2 and 3 return true for x > 1
```

4. variables as pointers 
Variables point to objects. Two variables can point to the same object. Variables can be reassigned to new object. Objects that variables point to can be mutated; in that case, all variables pointing to the original object will have the value of the mutated object. 

a = 'string'
b = a 
a.upcase 
b = 'string'
5. puts vs. return 
`puts` is a method that is called on an object. It prints it. An expression with `puts` will have the return value of `nil`.
`return` is the value of the last evaluated expression. If it is `puts` it will return `nil`. If it is a mathematical expression, it will return the value of the expression: 
``` ruby
1 + 2
# => 3
```
If it is a variable assignment, it will return the value of the variable:
``` ruby
a = 1 
# => 1
```



6. false vs. nil, 'truthiness'

  Only two values in Ruby are 'falsey': `false` and `nil`. Any other value is 'truthy'. `true` is not the same as 'truth', and `false` is not the same as `nil`. However, in a conditional `nil` evaluates to `false`, and any other value evaluates to `true`.
  
  
``` ruby 
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```
  In this code example, we will see "Hello is truthy" as the output. Variable assignment returns the value of the variable, which is a truthy value, so a will evaluate to `true`, despite the fact that it is not strictly speaking true.
  In the next example, we "Hello is falsey" is the output. Any expression with `puts` evaluates to `nil`, which is falsey.
  
  ``` ruby 
a = "Hello"

if puts "Hello"
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```
  
7. method definition and method invocation 
In method definition we define the method and any parameters it requires. In method invocation we call the method and pass in any arguments.
8. implicit return value of methods and blocks
Ruby does not require explicit return values. The last evaluated expression will provide the return value. 
9. Examine the code example below. The last line outputs the String 'Hi' rather than the String 'Hello'. Explain what is happening here and identify the underlying principle that this demonstrates.

```ruby 
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```
One line 124 the local variable `greeting` is initialized and assigned the value 'Hello'. On line 126 the `loop` method is invoked. On line 127 greeting is reassigned to the value 'Hi'. On line 28 we break out of the block argument of `loop`. The block will reassign `greeting` to 'Hi' one time before breaking. Because the variable was initialized in the main scope, it is accessible within the scope of the loop and so avabilable for reassignment. Line 131 will print 'Hi'. This example illustrates variable scoping rules, specifically that local variables initialized in the main scope are accessible from within a block.


10. Describe the method:
```ruby
def a_method
  puts "hello world"
end
```
On line 138 the method `a_method` is defined. It does not take a parameter. On line 139 the method will invoke the `puts` method and pass in the string "hello world". The method will print 'hello world' and return the value `nil`. 


On line 1 the variable a is initialized and set equal to the value 4. On line two, the variable b is initialized and set equal to 2. On line four, the `times` method is called on 2 and passed a block with the parameter a. This parameter happens to have the same name as the variable initialized online 1, but it is not the same. Inside the block on line 5 the block parameter a is set equal to 5. On line 6 the value of a is output by calling the `puts` method on it. The block will iterate twice, reassigning the block parameter and outputting 5 each time. On line 9 the `puts` method is called on the local variable a initialized on line 1. It will output 4. On line 10, the `puts` method is called on local variable b and outputs 2. This is an example of variable shadowing. The fact that the block parameter is given the same name as the variable on line one means that the value of local variable a cannot be changed within the block, as the block parameter will be accessed first.

On line one we initialize a local variable `a` and set it equal to the string `'hello'`. On line three we invoke the puts method and pass in the variable a, which will out put 'hello'. On line four we call the `puts` method and pass in the result of calling the `#object_id` method on a. This will output the object id number of a.

On line 6 we call the `#upcase!` method on a. This is a destructive method which will change the object a references so that it is the same object with the same id, but it will now be upcased. On line eight we call the `puts` method on a, which outputs 'HELLO'. On line nine we call the puts method on the result of calling the `#object_id` method local variable a, outputting the same id number as we did on line four.

In the second example, everything is the same except that on line six we call the `#upcase` method on local variable a, which is not mutating. On line 8, the original value will be output because the object was not changed. 

In this example we see the difference between mutable and immutable objects. One lines one, two, and three, the local variables are set equal to what look like identical strings, but each will have a different id number. They are separate objects that have the same form. Strings are mutable objects, so they may be qualitatively identical without being numerically identical. They occupy different space in memory.

On lines 13 and 14, local variable a is reassigned to the same value as c. It is now pointing to the same object 'name' that c is pointing to. On line 14, b is reassigned to the same value as a, so they are all pointing to the same object. If that object is mutated, they will all reflect the changes to the object.

On lines 21-23, local variables a, b, and c are set equal to the integer 5. Integers are immutable in Ruby. An integer will always have the same object id number. When you access 5, you always access the same object--it is numerically identical to every other instance of 5. 



On line 1, local variable `a` is set equal to the string `'hello'`. On line 2, the `puts` method is called on `a`, which will output the string 'hello'. On line 3 the `puts` method is called on the result  of calling the `object_id` method on a. This will output the object id of the string 'hello' that a is referencing. 

On line 5, a is reassigned the value of its previous value, 'hello' plus 'world'. One line 6 the `puts` method is called on a, outputting 'hello world'. On line 7, the `puts` method is again called on the result of calling the `object_id` method on a. Variable assignment is not mutating in Ruby, so a will now have a different id than it did in line 3, because it has been reassigned to a new object.
