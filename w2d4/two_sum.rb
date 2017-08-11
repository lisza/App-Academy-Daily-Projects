def bad_two_sum?(ary, target)

  # quadratic time complexity (nested loop)
  # constant space complexity

  ary.each_index do |i|
    ary.each_index do |j|
      next if j <= i
      return true if ary[i] + ary[j] == target
    end
  end

  false
end

def okay_two_sum?(ary,target)

  ary.each do |el|
    if ary.bsearch { |x| x == target - el }
      return true
    end
  end
  false

end

def two_sum?(ary,target)
  hash = Hash.new(true)

  ary.each do |x|
    hash[x] = true
  end

  ary.each do |el|
    return true if hash.has_key?(target - el)
  end

  false

end
