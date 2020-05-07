# advanced_12_6.rb

def my_method(array)
  if array.empty?
    []
  elsif array.length > 1
    array.map do
      |value| value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

The method originally returned nil for the last three calls because it interpreted line 7-9 as the rest of the elsif clause. That would evaluate to true but return nil, because there is no clause following in that branch.
