class Chopper
  def self.get_index(floor, ceiling)
    return floor + (ceiling - floor).quo(2).ceil
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
      return chop(needle, haystack, index, ceiling)
    else # will this ever get hit?  I don't think so
      return -1
    end
  end
end

class NonRecursiveChopper
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

CURRENT_CHOPPER = NonRecursiveChopper

# puts "\033[33mindex: #{index}, value: #{value}, needle: #{needle}, floor: #{floor} ceiling:#{ceiling} \33[0m"
