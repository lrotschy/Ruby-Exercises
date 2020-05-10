# # Easy_2_7.rb
# Easy_2_7.rb
# class Pet
#   attr_reader :type, :name
#   def initialize(type, name)
#     @type = type
#     @name = name
#   end
# end
#
# class Owner
#   attr_reader :name, :number_of_pets
#   def initialize(name)
#     @name = name
#     @number_of_pets = 0
#   end
# end
#
# class Shelter
#   def initialize
#     @adoptions = {}
#   end
#
#
#   def adopt(person, pet)
#     @adoptions[person] += 1
#   end
#
#   def print_adoptions
#   end
#
# end
# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')
#
# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')
#
# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."


# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin
#
# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester
#
# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
require 'pry'
require 'pry-byebug'
class Pet
  attr_accessor :adopted
  attr_reader :type, :name
  def initialize(type, name, adopted = false)
    @type = type
    @name = name
    @adopted = adopted
  end
end

class Owner
  attr_reader :name
  attr_accessor :number_of_pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
  end

  def to_s
    @name
  end
end

class Shelter
  attr_accessor :adoptions, :list_of_pets, :list_of_owners

  def initialize
    @adoptions = {}
    @list_of_pets = []
    @list_of_owners = []
  end

  def add_pet(name, breed)
    @list_of_pets << Pet.new(name, breed)
  end

  def add_owner(name)
    @list_of_owners << name
  end

  def adopt(person, pet)
    @adoptions[person] = []
    @adoptions[person] << pet
    binding.pry
    person.number_of_pets += 1
    pet.adopted = true
  end

  def print_adoptions
    @adoptions.each_key do |key|
      puts "#{key} has adopted the following pets:"
      @adoptions[key].each do |pet|
        puts "A #{pet.type} named #{pet.name}"
      end
    end
  end

  def print_unadopted_pets
    puts "The animal shelter has the following unadopted pets:"
    list_of_pets.each do |pet|
      puts "a #{pet.type} named #{pet.name}"
    end
  end

  def print_number_unadopted
    puts "The shelter has #{list_of_pets.length} unadopted pets."
  end
end



# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')


# bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.add_pet('cat', 'Butterscotch')
shelter.add_owner('P Hanson')
shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."


# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin
#
# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester
#
# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

# asta = Pet.new('dog', 'Asta')
# laddie = Pet.new('dog', 'Laddie')
# fluffy = Pet.new('cat', 'Fluffy')
# kat = Pet.new('cat', 'Kat')
# ben = Pet.new('cat', 'Ben')
# chatterbox = Pet.new('parakeet', 'Chatterbox')
bluebell = shelter.add_pet('parakeet', 'Bluebell')
shelter.display_unadopted_pets
