## A. Blocks 
### 1. Closures and scope
A closures is a chunk of code that is saved and executed at a later time. It binds surrounding artifacts so that they can be referred to later. 

If variables are in scope when the closure is created, their value will be accessible when the closure is executed, even if the value has changed.

```ruby 
def call_proc(proc)
  proc.call
end

name = 'Marvin'
print_name = Proc.new { puts "My name is #{name}."}
name = 'Rufus'

call_proc(print_name) # prints "My name is Rufus."


print_age = Proc.new { puts "I am #{age} years old."}
age = 98
call_proc(print_age) # undefinied local variable message
```

Closures in Ruby include blocks, Procs, and Lambdas. 

### 2. How blocks work and when we want to use them

#### a. When to use them:
  - To defer some implementation code to method invocation decision. Allows caller to refine method (e.g. #each)
  - For methods that perform 'before and after' actions--Sandwich Code (e.g. timers, logging, notification, system clean up)

```ruby 
def timer
  start_time = Time.now
    yield
  finish_time = Time.now
  puts "#{finish_time - start_time} seconds"
end
timer { puts "timing this!" }
```

### 3. Blocks and variable scope

Variables initialized outside the scope of a block are accessible from within the scope of the block. Variables initialized inside a block are not available outside the block. 

```ruby 
def add_it_up
  sum = 0
  (1..3).each do |n|
    sum += n
  end
  sum
end
puts add_it_up

def add_it_up2
  (1..3).each do |n|
    sum = 0
    sum += n
    puts sum
  end
# sum if we put it here, we get an error message: undefined local vairable
end
puts add_it_up2
```

Beware variable shadowing. If the block parameter has the same name as a variable in the outer scope it will 'shadow' the outer variable so that it is not accessible from within the block.

```ruby 
age = 58

(1..3).each do |i|
  puts "I am #{age}"
end

(1..3).each do |age|
  puts "I am #{age}."
end
```

### 4. Write methods with blocks and procs
Blocks 
```ruby 
def count(num)
  yield(num)
  end 
count(5) { |n| n * 4} # => 20
```
Procs 

```ruby 
def count(num, proc)
  proc.call(num)
end 
  
exponential = proc { |n| n ** 2 } 
cubed = Proc.new { |n| n ** 3 }

count(5, exponential) # => 25
count(5, cubed) # => 125
  ```
Lambdas 
```ruby 
def count(num, lambda)
  lambda.call(num)
end

# ranunculus = lambda { |n| "#{n} buttercups!"}
ranunculus =  -> (5) { "#{n} buttercups!"}

count(5, ranunculus) # => "5 buttercups!"
```

### 5. Methods with explicit block parameter
  ```ruby
  def count(num, &block)
    block.call(num)
  end

  count(5) { |n| n * 2 } # => 10
  ```
  
 -  prefix block name with `&`. This converts a block to a Proc object
 -  use block.call to call the block 
 -  allows blocks to be named and passed around--used in other methods
 -  returns undefined method error if block not given

```ruby 
# passing explicit blocks/procs to other methods
def method1(proc_or_block)
  proc_or_block.call
end

# def method2(&block)
def method2(block)
  puts "In this method we show how we can pass a block/proc argument to a method call inside a method"
  method1(block)
  puts "cool, huh?"
end

proc = proc {puts "i am the proc passed to method2, sometimes via block"}

# method2 {proc.call}  == ok with def method2(&block)
method2(proc)
```
 -  
### 6. Arguments and return values with blocks
- blocks have loose arity rules--if arg is empty, it returns nil; if extra, ignores them
```ruby 
def do_math(number, number2, number3)
  yield(number, number2, number3)
end

p do_math(3, 5, 7) {|a, b, c| (a + b + c) * 2} # returns 30
p do_math(3, 5, 7) {|n| n * 5} # retursn 15, only uses 3
p do_math(3, 5, 7) { 10 } # returns 10--ignores extra arguments

def do_math
  yield(1, 2, 3)
end

p do_math { 10 }

def do_math
  yield
end

do_math { |n| puts "This is n: #{n}"} # prints "This is n:" uses nil for missing arg
```
- procs are like blocks; lambdas enforce arity

```ruby
def printit(str, proc)
  proc.call(str)
end

full_string = "string"
nil_string = ''
example_proc = proc { |str| puts "Here is a #{str}." }

printit(full_string, example_proc) # => "Here is a string."
printit(nil_string, example_proc) # => "Here is a ."

def printit2(proc)
  proc.call
end
printit2(example_proc) # => "Here is a ."

def printit3(str1, str2, proc)
  proc.call(str1, str2)
end
printit3('string', 'another string', example_proc) # => "Here is a string."
```

- a block's return value is the last line evaluated; the method return value depends on the method (e.g. `each` vs. `map`)

Examples of return values of block and how they are used by methods:
```ruby 
p [1, 2, 3, 4, 5].map { |n| n.to_s}
p [1, 2, 3, 4, 5].each { |n| n.to_s}
p [1, 2, 3, 4, 5].map { |n| puts n }
p [1, 2, 3, 4, 5].each { |n| puts n}
```
- 
### 7. When you can pass a block to a method 
- All methods can take an optional block as an implicit parameter.  
- #yield() invokes passed in block argument. If not block is given LocalJumpError. To check: `yield if block_given?`

```ruby 
def method1
  puts "now calling block:"
  yield
end

method1 {puts "block"}
method1 # LocalJumpError

def method2
  if block_given?
    yield
  else
    puts "no block this time!"
  end
end
method2 {puts "here's the block!"}
method2
```
### 8. `%:symbol`
- if object is a proc, uses it by turning it into a block
- else converts symbol to proc by calling #to_proc on the object then turns into a block
- can be passed to any method requiring a block
- must be a method that can be called on the object and must not need additional arguments 
- 
```ruby 
p [1, 2, 3, 4, 5].map(&:to_s)
p [1, 2, 3, 4, 5].map { |n| n.to_s}
```
