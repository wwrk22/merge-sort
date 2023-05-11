def merge_sort(nums)
  # Base case
  return nums if nums.length <= 1

  # Recursive case
  mid_index = nums.length / 2
  left_half = merge_sort(nums[0..mid_index - 1])
  right_half = merge_sort(nums[mid_index..])
  return merge(left_half, right_half)
end

def merge(left_half, right_half)
  merged = []
  i, j = merge_equal_lengths(merged, left_half, right_half)
  left_half[i..].each { |num| merged << num } if i < left_half.length
  right_half[j..].each { |num| merged << num } if j < right_half.length
  merged
end

def merge_equal_lengths(merged, left_half, right_half)
  i, j = 0, 0

  until i == left_half.length || j == right_half.length
    if left_half[i] < right_half[j]
      merged << left_half[i]
      i += 1
    else
      merged << right_half[j]
      j += 1
    end
  end

  return i, j
end


puts "[]: #{merge_sort([])}"
puts "[1]: #{merge_sort([1])}"
puts "[1, 2]: #{merge_sort([1, 2])}"
puts "[2, 1]: #{merge_sort([2, 1])}"
puts "[2, 3, 1]: #{merge_sort([2, 3, 1])}"
puts "[1, 2, 3]: #{merge_sort([1, 2, 3])}"
puts "[5, 2, 1, 3, 6, 4]: #{merge_sort([5, 2, 1, 3, 6, 4])}"
puts "[4, 8, 6, 2, 1, 7, 5, 3]: #{merge_sort([4, 8, 6, 2, 1, 7, 5, 3])}"
