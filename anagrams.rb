###### Not working ##########
def permutations_review(arr)
  return arr if arr.length == 1
  final = []

  el = arr[0]

  perms = permutations_review(arr[1..-1])

  perms.each do |sub_ary|
    (0...arr.length).each do |i|
      perms << arr[0..i] + el + arr[i..-1]
    end
  end

  perms
end
############################


def anagrams?(str1, str2)
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
