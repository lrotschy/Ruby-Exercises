# Medium_4.rb
require 'pry'
require 'pry-byebug'

class CircularQueue
  attr_accessor :queue, :max_size

  def initialize(n)
    @queue = []
    @max_size = n
  end

  def enqueue(object)
    if queue.length == max_size
      queue.pop
    end
    queue.prepend(object)

  end

  def dequeue
    queue.pop
  end
end


# class CircularQueue
#
# attr_accessor :queue, :order, :current_index, :size
#
#   def initialize(n)
#     @queue = Hash.new { }
#     @order = Array.new
#     @current_index = 1
#     @size = n
#     (1..n).each do |n|
#       @queue[n] = nil
#     end
#   end
#
#   def move_queue_position
#     if current_index == size
#       @current_index = 1
#     else
#       @current_index += 1
#     end
#   end
#
#   def add_object(object)
#     queue[current_index] = object
#     order.prepend(current_index)
#   end
#
#   def check_queue
#     # binding.pry
#     (1..size).each do
#       if queue[current_index] == nil
#         return current_index
#       else
#         move_queue_position
#       end
#     end
#     nil
#   end
#
#   def enqueue(object)
#     if check_queue
#       add_object(object)
#     else
#       queue[order.last] = object
#       order.prepend(order.pop)
#     end
#   end
#
#
#   def dequeue
#     return nil if order.empty?
#     # queue[order.pop] = nil
#     dequeued_item = queue[order.last]
#     queue[order.last] = nil
#     order.pop
#     dequeued_item
#   end
#
# end


# class CircularQueue
#
# attr_accessor :queue, :order, :length, :current_index, :queue_size
#
#   def initialize(n)
#     @queue = Array.new(n)
#     @order = Array.new
#     @length = n
#     @current_index = 0
#     @queue_size = n
#   end
#
#   def move_queue_position
#     if current_index == length - 1
#       @current_index = 0
#     else
#       @current_index += 1
#     end
#   end
#
#   def add_object(object)
#     queue[current_index] = object
#     order.prepend(current_index)
#   end
#
#   def check_queue
#     # binding.pry
#     (1..length).each do
#       if queue[current_index] == nil
#         return current_index
#       else
#         move_queue_position
#       end
#     end
#     nil
#   end
#
#   def enqueue(object)
#     if check_queue
#       add_object(object)
#     else
#       queue[order.last] = object
#       order.prepend(order.pop)
#     end
#   end
#
#
#   def dequeue
#     return nil if order.empty?
#     # queue[order.pop] = nil
#     queue.delete_at(order.pop)
#   end
#
# end

# queue = CircularQueue.new(3)
# p queue.queue
# p queue.order
# puts "check queue empty"
# p queue.check_queue
# puts "done checking queue"
# queue.enqueue('a')
# queue.enqueue('b')
# queue.enqueue('c')
# puts "check queue one object"
# p queue.check_queue
# puts "done checking queue"
# p queue.order
#
# queue.dequeue
# p queue.queue
# p queue.order
# p queue.check_queue

queue = CircularQueue.new(3)
puts queue.dequeue == nil
# binding.pry
queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1
# binding.pry
queue.enqueue(3)
queue.enqueue(4)

puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil





# assign object to first empty spot after newest
#   if array is empty, assign to 0
#   else go to oldest. add 1, if empty, assing
#     keep going until nil spot or end
#     if end, start from 0 up to oldest
#   add index to beginning of order array
# index = nil
# object_enqueued = false
#
# if order.empty?
#   queue[0] = object
#   index = 0
#   object_enqueued = true
# else
#   (order.last..length-1).each do |idx|
#     if queue[idx] == nil
#       index = idx
#       queue[idx] = object
#       object_enqueued = true
#     end
#
#     if object_enqueued == false
#       binding.pry
#       (0..(order.last)).each do |idx|
#         if queue[idx] == nil
#           index = idx
#           queue[idx] = object
#           object_enqueued = true
#         end
#       end
#     end
#
#     if object_enqueued == false
#       queue[order.last] = object
#       index = order.last
#       dequeue
#     end
#   end
# end
# order.prepend(index)
# end
