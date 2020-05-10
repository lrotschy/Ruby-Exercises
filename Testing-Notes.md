Minitest comes with Ruby.
RSpec is a Domain Specific Language used for testing. It is more complex.

### 3. SEAT approach

1. Set up the necessary objects 
2. Execute the code against the object we are testing
3. Assert the results of the execution 
4. Tear down and clean up any lingering artifacts 

3 and 4 are necessary

### 4. Assertions 
assert_equal(expected, actual) 
calls `==` on the objects
define in your custom classes

Example using name as the value to test for equality:
```ruby 
def ==(other)
    name == other.name
  end
```
