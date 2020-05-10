# Easy_1_1.rb Further Exploration
require 'pry'
require 'pry-byebug'

class Banner
  def initialize(message, width)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+#{'-' * (@width)}+"
  end

  def empty_line
    "|#{' ' * (@width)}|"
  end

  def split_message
    new_message = []
    return new_message if @message == ''
    message_words = @message.split

    index = 0
    add = 1

    loop do
      if message_words[index..index + add].join(' ').length > @width - 2
        new_message << message_words[index..(index + add - 1)]
        index += add
      else
        add += 1
      end
      break if index >= message_words.length - 1
    end
    new_message
  end

  def message_line
    @new_message = split_message.map do |line|
      "|#{line.join(' ').center(@width)}|"
    end
    @new_message.join("\n")
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 10)
puts banner

banner = Banner.new('', 20)
puts banner


# Easy_1_1.rb Basic
#
# class Banner
#   def initialize(message)
#     @message = message
#   end
#
#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end
#
#   private
#
#   def horizontal_rule
#     "+#{'-' * (@message.length + 2)}+"
#   end
#
#   def empty_line
#     "|#{' ' * (@message.length + 2)}|"
#   end
#
#   def message_line
#     "| #{@message} |"
#   end
# end
#
# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
#
# banner = Banner.new('')
# puts banner
