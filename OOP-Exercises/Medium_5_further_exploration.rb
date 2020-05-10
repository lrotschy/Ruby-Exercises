# Medium_5_further_exploration

class MinilangError < RuntimeError; end
class MinilangNoMethodError < MinilangError; end
class MinilangEmptyStackError < MinilangError; end

class Minilang
  attr_accessor :program, :stack, :register, :methods
  METHODS = ['push', 'add', 'sub', 'mult', 'div', 'print', 'mod', 'pop']
  def initialize(program)
    @program = program
    @stack = []
    @register = 0
    @methods = []
  end

  def format_program(opt_arg = nil)
    if opt_arg
      formatted_program = format(program, opt_arg)
    else
      formatted_program = program
    end
  end

  def eval(opt_arg=nil)
    format_program(opt_arg).downcase.split.each do |method|
      if method.to_i.to_s == method
        @register = method.to_i
      elsif METHODS.include?(method)
        self.send(method)
      else
        raise MinilangNoMethodError, "Invalid method: #{method}"
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
      raise MinilangEmptyStackError, "Empty stack!"
    end
  end
end

CENTIGRADE_TO_FARENHEIT = '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
minilang = Minilang.new(CENTIGRADE_TO_FARENHEIT)
minilang.eval(degrees_c: 100)
minilang.eval(degrees_c: 0)
minilang.eval(degrees_c: -40)

AREA_OF_A_RECTANGLE = '%<length>d PUSH %<width>d MULT PRINT'
minilang2 = Minilang.new(AREA_OF_A_RECTANGLE)
minilang2.eval(length: 5, width: 4)
