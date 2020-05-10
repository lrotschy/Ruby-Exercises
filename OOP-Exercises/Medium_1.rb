# Medium_1.rb
class Machine

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def switch_setting
    switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new
machine.start
machine.stop
p machine.switch_setting
p machine
puts machine 
