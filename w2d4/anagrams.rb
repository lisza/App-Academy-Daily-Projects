def first_anagram?(str1, str2)
  # time complexity O(n! + n)
  # space complexity O(n!)
  all_permutations = permutations(str1)

  all_permutations.include?(str2)
end

def permutations(str)
  return [str] if str.length < 2

  result = []

  permutations(str[1..-1]).each do |sub_str|
    (0...str.length).each do |i|

      result << sub_str.dup.insert(i, str[0])
    end
  end
  result
end

def second_anagram?(str1, str2)
  # linear time complexity
  # constant space complexity

  str1_copy = str1.dup
  str2_copy = str2.dup

  str1.each_char do |ch| # loop through string 1
    char_idx = str2_copy.index(ch)

    if char_idx
      str2_copy[char_idx] = ""
      str1_copy[str1_copy.index(ch)] = ""
    end

  end

  p str1_copy
  p str2_copy

  str2_copy.empty? && str1_copy.empty?
end

def third_anagram?(str1, str2)
  # time complexity O(n^2)
  # space complexity O(1)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  # time complexity O(n)
  # space complexity O(n)
  str1_hash = Hash.new(0)
  str2_hash = Hash.new(0)

  str1.chars.each do |ch|
    str1_hash[ch] += 1
  end

  str2.chars.each do |ch|
    str2_hash[ch] += 1
  end

  str1_hash == str2_hash
end
