# Ruby Object-Oriented Programming Notes
### LS 120 Notes

### is-a has-a 
 - is-a describes inheritance relations
 - has-a describes methods

## What is an object? 

An object is an encapsulation of local state and behavior.

An object is an instantiation of a class, with attribute values instead of variables.

objects communicate through methods

states and behaviors-- all objects of the same class have identical behaviors but different states

## States vs. Behaviors 
States are scoped at the instance level. States track attributes of an object. States are tracked with instance variables. A constructor method sets the initial state of an object.

'An object's attributes are the data items that are bundled inside the object. These items are also called instance variables or member fields.' (zetcode)

Behaviors are identical for all instances of a class. They are what an object can do--they are the methods that can be called on an object.

## What is a class?

A class is a template or blueprint for an object. It defines states and behaviors of an object, providing variables and initial values for states.  

It also structures encapsulation of private methods and attributes and an interface for other objects to access public methods and attributes. 

## Encapsulation 

Bundling of methods and data to hide or restrict access to an object's components and information. Limited access is provided through interface methods.

- The purpose of encapsulation: 
- data protection
- define boundaries and allow for greater complexity
- provide defined interfaces between objects
- creates a new level of abstraction

```ruby 

class Client

  private

  attr_reader :password

  def initialize(name, password, list_of_account_numbers)
    @name = name
    @password = password
    @accounts = list_of_account_numbers
  end

  public

  def verify_password(input)
    password == input
  end

end

jim = Client.new('Jim', 123)
p jim.verify_password(456)
p jim.password 
```


```ruby 

class Human
  attr_accessor :pets, :shelter
  def initialize
    @pets = []
    @shelter = Shelter.new
  end

  def adopt_pet
    @pets << shelter.choose_pet
  end

end

class Shelter
  attr_accessor :pets, :number_of_available_pets
  
  def initialize
    @pets = ['Herb the cat', 'Alfonso the goldfish', 'Jimmy the poodle', 'Hilbert the corgi']
    @number_of_available_pets = @pets.length
  end

  def add_pet(pet)
    @pets << pet
  end

  def choose_pet
    @pets.sample
  end

  def feed_pets
    puts "feeding the animals now"
  end
end

henry = Human.new
puts henry.pets
henry.adopt_pet

henry.shelter.add_pet('Tarski the parrot')
puts henry.shelter.pets
puts henry.shelter.feed_pets
puts henry.shelter.number_of_available_pets
```

## Polymorphism 

The ability of different classes of objects to respond differently to the same method call. Methods can have the same interface but different implementation.

- subclasses overriding method definition of parent class 
- modules overriding superclass methods
- duck typing (define methods with same name within classes so they can be called from a different class; not inherited)

Benefits: 
- flexibility 
- abstraction 
- intuitive use of methods

```ruby

# polymorphism example

module Waggable

  def has_a_tail
    puts "I have a tail."
  end

end

class Mammal

  def warm_blooded
    puts "I am warm blooded"
  end

  def speak
    puts "I am speaking"
  end

end

class Dog < Mammal
  include Waggable

  def has_a_tail
    puts "I usually have a long, furry tail"
  end

  def speak
    puts "I am barking"
  end

end

class Reptile
  include Waggable
end

fido = Dog.new
fido.speak
fido.has_a_tail
jimmy = Reptile.new
jimmy.has_a_tail

```

## Benefits of OOP 

- Greater abstraction. We can think about behaviors and objects intuitively without having to focus on implementation details. 
- Encapsulation prevents ripple effect of small changes due to dependencies throughout program. Because objects have limited interfaces, dependencies are also limited and easier to manage. A program is made up of the interaction of many small, somewhat independent parts rather than one giant set of methods.
- Code is more flexible and reusable due to inheritance, polymorphism, and encapsulation
- Inheritance and polymorphism make it possible to define general behaviors in superclasses and more detailed, specific behaviors in subclasses 
- Program development can be faster because of the modular nature of objects
- Programs can be developed in a way that is more conceptual and less procedural. We can think at an abstract, intuitive level about what objects we need and what behaviors they should be responsible for.

## Cons of using OOP
- Indirection can cause confusion 
Indirection is the use of multiple interfaces between elements--not referring directly to an object, but having to reach it through an added interaction layer. Indirection is critical to systems design, but can add complexity if overused.

"...the ability to reference something using a name, reference, or container instead of the value itself."

So is the creation of helper methods to appease rubocop a type of indirection? Creating a card object rather than just creating methods within a deck that do the same work? Accessing a constant rather than a value directly?

Zed Shaw: "Abstraction is used to reduce complexity. Indirection is used to reduce coupling or dependence." Also: "most of the definitions mention some form of additional complexity or annoyance from having to deal with indirection which implies that you pay for the flexibility with increased complexity."
- Poor design/implementation could make code more difficult to understand
- Too many interdependencies could negate some of the benefits described above, e.g. ripple effects of changes, lack of reusability

## Four pillars of OOP:
- abstraction
- polymorphism
- encapsulation
- inheritance 

## Collaborator Objects 
- objects that are stored as a state within another object

- collaborator objects collaborate to perform some action

- represent connections between classes in a program 

- an object from another class that interacts with an object to share responsibilities

```ruby

class Person
attr_reader :car
  def initialize 
    @car = Car.new
  end
end

class Car
end 

```

## Self 

`self` references the calling object. When used inside a class but outside an instance method it references the class itself. When used inside an instance method it references the calling object--the particular instantiation.

It is used with setter methods to avoid confusion with local variables.

It is used to define class methods. 

## Getter and setter methods 
attr_accessor :var_name
attr_reader
attr_writer

def var_name 
  @var_name 
end 

def var_name=(arg)
 @var_name = arg
end 

```ruby 

class Dog 
  # attr_accessor :status 
  # attr_reader :name 
  
  def initialize(name)
    @name = name 
    @status = 'hungry' 
  end 
  
  def feed 
    self.status = "not hungry"
   # @status = "not hungry"
  end
  
  def name 
    @name 
  end 
  
  def status 
    @status 
  end 
    
  def status=(status)
    @status = status 
   end
end 
```
## Instance vs. class methods
Instance methods are defined within a class and are called on instances of the class.

Class methods are defined within a class with `def self.method_name`. They are called on the class itself, not by instances of the class.

Instance methods typically interact with instance variables and class methods typically interact with class variables.

```ruby 

class Dog
  @@number_of_dogs = 0
  def self.number
    @@number_of_dogs
  end

  def initialize(name)
    @name = name
    @@number_of_dogs += 1
  end
end

puts Dog.number
fido = Dog.new('Fido')
puts Dog.number
```

## Instance vs. class variables 
Instance variables track attributes of an object instantiation of a class. Class variables track information about the class itself. Instance variables are prefixed with `@`; class variables are prefixed with `@@`.

See example above.

Class variables should be used with caution and rarely. Class variables are available to an any object in the class or in any of its subclasses, so changes made far down the inheritance chain will affect the class variable they refer to.


## Modules 

A collection of behaviors usable within classes via mixins

grouping of related methods; namespacing

used when superclass/subclass inheritance doesn't provide a good model for how behaviors are distributed 

used for 'has a' relationships (as in "has an ability to swim"); not 'is a' relationships (as in 'is a type of mammal')

can mix in as many modules as you like but you can only subclass from one parent class

Can contain methods, classes, and constants. Cannot instantiate and cannot contain subclasses.

## Method Lookup Path 

Ruby looks up which method to use based on a strict method lookup path.  First to class, then module (most recently added first if there is more than one), then super class then superclass modules, then object, kernel, basic oject 

This allows for polymorphism--methods defined in the class will override methods defined by superclasses

## Fake Operators and equality
Lesson 3: Equivalence
Lesson 3: Fake Operators

The default value for the `==` instance method from Basic Object is the same as that of `.equal?`, that is, it checks to see if two objects are identical objects. It can and should be rewritten to suit the needs of new classes. You get `!=` for free.

```ruby

# for example:
def ==(other)
  name == other.name 
end 
```

Many apparent operators are actually instance methods and can be rewritten.
`.to_s` should always be rewritten

`include Comparable` and re-define `<=>` and get all comparisons and `==` for free.


## Scoping rules of objects and classes
@instance variables 
- scoped at object level
- available within instance methods even if not passed in as arguments
- referring to uninitialized instance variable returns `nil`

@@class variables 
- scoped at class level 
- All objects share 1 copy of class variable. -  Class methods can access class variables. 
- best to avoid them, generally

CONSTANTS 
- lexical scope (available within function where it was defined)
- Can be accessed by other classes with ClassName::CONSTANT (namespace resoution operator)
- inherited from superclass
- mix-in constants must use namespace resolution operator
- 
## Using super
super is used within methods. It calls method from superclass and passes in any arguments to fill out superclass method. Common with initialize.

```ruby

def initialized(name, age, color)
  super(name, age)
  @color = color 
end
```
## truthiness
Same as before. All values are truthy except for `nil` and `false`

## reading OO code 
What about it?

## inheritance

- A class inherits behaviors from a superclass--methods and attributes are passed down to children unless overwritten. 
- More general behaviors are defined in the superclass; more specific behaviors are defined with subclasses. 
- Inheritance allows for more streamlined code.
- Ruby does not have multiple inheritance. Classes can only inherit from one superclass.
- Ruby does have mix-ins.

## p vs. puts called on objects 
p returns a data thing with object id and instance variables and values 
puts outputs a string of data with object id

## setter method return value

## private, protected, public 

- public are available anywhere, comprise the class's interface 

- private methods not available outside the class. They can only be called within the class when called without self 

- protected methods are public within the class--the can be called by other objects of the same class--but private outside the class 




