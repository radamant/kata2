class RecursiveChopper
  def chop(needle, haystack, floor = 0, ceiling = nil)
    return -1 if haystack.empty?

    ceiling = haystack.size - 1  if ceiling.nil?
    index = floor + (((ceiling - floor) / 2.0).ceil)
    
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

CURRENT_CHOPPER = RecursiveChopper

