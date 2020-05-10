# Easy_2_1.rb


class Reader
  def initialize(input)
    @input = input
  end

  def read
    new_str = ''
    idx = 0
    wrd = 0
    temp = ''
    while idx < @input.length
      if @input[idx] == ' ' && (new_str.empty? || @input[idx + 1] == '.'|| @input[idx + 1] == ' ')
          new_str += ''
      elsif @input[idx] == ' ' || @input[idx] == '.'
        new_str += @input[idx]
      else
        if wrd.even?
          wrd += 1 if ('a'..'z').include?(@input[idx].downcase) && @input[idx + 1] == ' '
          new_str += @input[idx]
        elsif wrd.odd?
          temp.prepend(@input[idx])
          if ('a'..'z').include?(@input[idx].downcase) && @input[idx + 1] == ' '
            temp.chars.each {|ch| new_str += ch}
            temp = ''
            wrd += 1
          end
        end
      end
      idx += 1
    end
    new_str
  end

end
p Reader.new('this is a string.').read
p Reader.new('s').read
p Reader.new(' ').read
p Reader.new('one    .').read
p Reader.new('   One    string is a a a a longely one    .').read



#   def read
#     # words = @input.strip.split(/[ ]|\./)
#     words = @input.scan(/\b\w+\b/i)
#     p words
#     array_output = []
#     words.each_with_index do |wrd, idx|
#       idx.odd? ? array_output << wrd.reverse : array_output << wrd
#     end
#     array_output.join(' ') + '.'
#   end
# end



  # def read
  #   new_str = ''
  #   idx = 0
  #   wrd = 0
  #   temp = ''
  #   while idx < @input.length
  #     # if new_str.empty? && @input[idx] == ' ' || (@input[idx] == ' ' && (@input[idx + 1] == '.' || @input[idx + 1] == ' '))
  #     #   new_str += ''
  #     if @input[idx] == ' ' && (new_str.empty? || @input[idx + 1] == '.'|| @input[idx + 1] == ' ')
  #         new_str += ''
  #     elsif @input[idx] == ' ' || @input[idx] == '.'
  #       new_str += @input[idx]
  #     else
  #       if wrd.even?
  #         wrd += 1 if ('a'..'z').include?(@input[idx].downcase) && @input[idx + 1] == ' '
  #         #   new_str += @input[idx]
  #         #   wrd += 1
  #         # else
  #         new_str += @input[idx]
  #         # end
  #       elsif wrd.odd?
  #         # if ('a'..'z').include?(@input[idx].downcase) && @input[idx + 1] == ' '
  #           # temp.prepend(@input[idx])
  #           wrd += 1
  #           temp.chars.each {|ch| new_str += ch}
  #           temp = ''
  #         # else
  #         #   temp.prepend(@input[idx])
  #         # end
  #         temp.prepend(@input[idx])
  #
  #       end
  #     end
  #     idx += 1
  #   end
  #   new_str
  # end
