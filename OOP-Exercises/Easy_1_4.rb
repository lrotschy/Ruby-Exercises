# Easy_1_4.rb

class Book
  attr_accessor :title, :author
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# The problem with not defining an initialize method is that a new book object can be created without a title or author, which could create problems if you try to access it in your program. It could also be a problem that someone could get access to the title and change it, when you really prefer that it remain unchanged. On the other hand, you might want to define a custom method for setting the title to account for capitalization problems, etc.
