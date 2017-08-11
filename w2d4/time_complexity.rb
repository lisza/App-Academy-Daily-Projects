def my_min_phase1(arr)
  # quadratic time complexity
  # space complexity of O(1)
  arr.each do |el1|
    smallest = true
    arr.each do |el2|
      smallest = false if el2 < el1
    end
    return el1 if smallest
  end
end

def my_min_phase2(arr)
  # linear time complexity
  # space complexity = O(1)
  current_min = arr.first
  arr[1..-1].each do |el|
    current_min = el if el < current_min
  end
  current_min
end

require 'byebug'
def largest_contiguous_sub_sum_phase1(ary)
  # time complexity of O(n^3)
  #space complexity of O(1)
  sub_arys = []

  ary.each_index do |idx|
    (idx...ary.length).each do |idx2|
      sub_arys << ary[idx..idx2]
    end
  end

  sub_arys.map { |x| x.reduce(:+)}.max

end


def largest_contiguous_sub_sum_phase2(ary)
  # O(n) calculations
  # O(1) space complexity
  largest = -1
  current = 0

  i = 0

  until i == ary.length # n calculations
    current += ary[i]
    largest = current if current > largest
    current = 0 if current < 0
    i += 1
  end

  largest
end
