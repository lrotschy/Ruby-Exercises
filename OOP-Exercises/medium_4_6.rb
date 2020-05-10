# medium_4_6.rb


class Computer1
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

hal = Computer1.new
hal.create_template
p hal.show_template

# This one defines a method which which set an instance variable to the value of the template. The computer will not have a template until this method is called on it. It does have getter and setter methods for the template. The show_template method uses the getter method to access the template. The create_template does not use the setter method. Instead it sets the value of the instance variable directly. So there is some redundancy in the code.

class Computer2
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

r2d2 = Computer2.new
r2d2.create_template
p r2d2.show_template
p r2d2.instance_variables

# This method uses the setter method inside another method to set the template value, and it used the getter method inside another method to show the value. The attr_accessor method will create the instance method when the setter method is called, but it is not initialized explicitly in the code. self is not required in the getter method.
