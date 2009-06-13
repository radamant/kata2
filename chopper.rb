class RecursiveChopper
  def chop(needle, haystack, floor = 0, ceiling = nil)
    ceiling = haystack.size == 0 ? 0 : haystack.size - 1  if ceiling.nil?
    index = floor + (((ceiling - floor) / 2.0).ceil)
    
    val = haystack[index]
    return -1 if val.nil?
    return index if val == needle
    return -1 if floor == ceiling

    if val > needle
      return chop(needle, haystack, floor, index - 1)
    else
      return chop(needle, haystack, index, ceiling)
    end
  end
end

CURRENT_CHOPPER = RecursiveChopper

