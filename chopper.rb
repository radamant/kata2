class Chopper
  def self.get_index(floor, ceiling)
    return floor + (ceiling - floor).quo(2).ceil
    #(floor + ceiling)/ 2
  end


  def self.implementations
    [RecursiveChopper, RecursiveChopper2,  IterativeChopper]
  end
end

class RecursiveChopper
  def chop(needle, haystack, floor = 0, ceiling = nil)
    return -1 if haystack.empty?

    ceiling = haystack.size - 1  if ceiling.nil?
    index = Chopper.get_index(floor, ceiling)
    
    val = haystack[index]

    if val == needle
      return index
    elsif floor == ceiling
      return -1
    elsif val > needle
      return chop(needle, haystack, floor, index - 1)
    elsif val < needle
      return chop(needle, haystack, index + 1, ceiling)
    else # will this ever get hit?  I don't think so
      return -1
    end
  end
end


# Like RecursiveChopper, but has different result detection
# based on reading the Wikipedia article on binary chops
# 
# The new points were:
#   a) why do the == test first?  it's the test that will succeed the least # of times
#   b) index generation is generally different for recursive/non-recursive solutions 
#      note: that this does not use the Chopper.get_index method

class RecursiveChopper2
  def chop(needle, haystack, floor = 0, ceiling = haystack.size - 1)
    return -1 if ceiling < floor

    index = floor + ((ceiling - floor) / 2) 
    val = haystack[index]

    if val < needle
      return chop(needle, haystack, index + 1, ceiling)
    elsif val > needle
      return chop(needle, haystack, floor, index -1)
    else
      return index
    end
  end
end

# First stab at an iterative chopper
class IterativeChopper
  def chop(needle, haystack)
    return -1 if haystack.empty?
    
    ceiling = haystack.size - 1
    floor = 0
    begin
      index = Chopper.get_index(floor, ceiling)
      value = haystack[index]
      
      if value == needle
        return index
      elsif floor == ceiling
        return -1
      elsif value > needle
        ceiling = index - 1
      elsif value < needle
        floor = index
      else
        return -1
      end
    end while(floor <= ceiling)
    
    return -1
  end
end

# puts "\033[33mindex: #{index}, value: #{value}, needle: #{needle}, floor: #{floor} ceiling:#{ceiling} \33[0m"
