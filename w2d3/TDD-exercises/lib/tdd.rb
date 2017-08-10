

def my_uniq(arr)
  uniqs = []
  arr.each do |el|
    uniqs << el unless uniqs.include?(el)
  end
  uniqs
end

class Array
  def two_sum
    zero_indices = []
    self[0..-2].each_index do |i|
      self.each_index do |j|
        next if j <= i
        zero_indices << [i, j] if self[i] + self[j] == 0
      end
    end
    zero_indices
  end
end

def my_transpose(arr)
  transposed = []
  sub_arr = []

  arr.each_index do |row|
    arr.each_index do |col|
      sub_arr << arr[col][row]
    end
    transposed << sub_arr
    sub_arr = []
  end
  transposed
end
