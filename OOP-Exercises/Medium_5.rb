# Medium_5.rb

# class Minilang # this is my test run with send
#   attr_accessor :program
#
#   def initialize(program)
#     @program = program
#   end
#
#   def eval
#     program.downcase.split.each do |m|
#       self.send(m)
#     end
#   end
#
#   def print
#     puts "hi"
#   end
#
#   def add
#     puts "3 + 4"
#   end
#
#   def sub
#     puts 'subtract'
#   end
# end
#
# minilang = Minilang.new('PRINT SUB ADD')
# minilang.eval

require 'pry'
require 'pry-byebug'
# class Minilang
#   attr_accessor :program, :stack, :register, :methods
#
#   def initialize(program)
#     @program = program
#     @stack = []
#     @register = 0
#     @methods = []
#   end
#
#   def eval
#     split_program
#     run_program
#   end
#
#   def run_program
#     methods.each do |method|
#       # binding.pry
#       if method.to_i.to_s == method
#         @register = method.to_i
#       elsif method == "PUSH"
#         stack.push(register)
#       elsif method == "ADD"
#         self.register = register + stack.pop
#       elsif method == "SUB"
#         self.register = register - stack.pop
#       elsif method == "MULT"
#         self.register = register * stack.pop
#       elsif method == "DIV"
#         self.register = register / stack.pop
#       elsif method == "MOD"
#         self.register = register % stack.pop
#       elsif method == "POP"
#         self.register = stack.pop
#       elsif method == "PRINT"
#         puts register
#       end
#     end
#   end
#
#   def split_program
#     self.methods = program.split
#   end
#
# end

class Minilang # My version with exception handling
  attr_accessor :program, :stack, :register, :methods

  def initialize(program)
    @program = program
    @stack = []
    @register = 0
    @methods = []
  end

  def format_program(opt_arg = nil)
    opt_arg ? format(program, opt_arg) : program
  end

  def eval(opt_arg=nil)
    format_program(opt_arg).downcase.split.each do |method|
      begin
        if method.to_i.to_s == method
          @register = method.to_i
        else
          self.send(method)
        end
      rescue NoMethodError => e
        puts "Invalid token: #{e}"
      end
    end
  end

  def push
    stack.push(register)
  end

  def add
    self.register = register + stack.pop
  end

  def sub
    self.register = register - stack.pop
  end

  def mult
    self.register = register * stack.pop
  end

  def div
    self.register = register / stack.pop
  end

  def mod
    self.register = register % stack.pop
  end

  def pop
    self.register = stack.pop
  end

  def print
    if register
      puts register
    else
      puts "Empty stack!"
    end
  end
end
# refactored to include some ideas from solution

# class MinilangError < RuntimeError; end
# class MinilangNoMethodError < MinilangError; end
# class MinilangEmptyStackError < MinilangError; end
#
# class Minilang
#   attr_accessor :program, :stack, :register, :methods
#   METHODS = ['push', 'add', 'sub', 'mult', 'div', 'print', 'mod', 'pop']
#   def initialize(program)
#     @program = program
#     @stack = []
#     @register = 0
#     @methods = []
#   end
#
#   def format_program(opt_arg = nil)
#     opt_arg ? format(program, opt_arg) : program
#   end
#
#   def eval(opt_arg=nil)
#     format_program(opt_arg).downcase.split.each do |method|
#       if method.to_i.to_s == method
#         @register = method.to_i
#       elsif METHODS.include?(method)
#         self.send(method)
#       else
#         raise MinilangNoMethodError, "Invalid method: #{method}"
#       end
#     end
#   end
#
#   def push
#     stack.push(register)
#   end
#
#   def add
#     self.register = register + stack.pop
#   end
#
#   def sub
#     self.register = register - stack.pop
#   end
#
#   def mult
#     self.register = register * stack.pop
#   end
#
#   def div
#     self.register = register / stack.pop
#   end
#
#   def mod
#     self.register = register % stack.pop
#   end
#
#   def pop
#     self.register = stack.pop
#   end
#
#   def print
#     if register
#       puts register
#     else
#       raise MinilangEmptyStackError, "Empty stack!"
#     end
#   end
# end

CENTIGRADE_TO_FARENHEIT = '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
minilang = Minilang.new(CENTIGRADE_TO_FARENHEIT)
minilang.eval(degrees_c: 100)
minilang.eval(degrees_c: 0)
minilang.eval(degrees_c: -40)

AREA_OF_A_RECTANGLE = '%<length>d PUSH %<width>d MULT PRINT'
minilang2 = Minilang.new(AREA_OF_A_RECTANGLE)
minilang2.eval(length: 5, width: 4)

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5
#
Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12
#
Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB
#
Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8
#
Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)
