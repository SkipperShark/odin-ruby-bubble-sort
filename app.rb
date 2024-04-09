# > bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]

#pseudocode

#first iteration
  # from 0 to last, go through and swap elements
  # if at last index, do nothing
# run checking iteration to check if more iterations are needed
# if yes, then perform 2nd iteration
# second iteration
  # from 0 to last - 1, go through and swap elements
# run checking algorith again
# if the checking iteration says no more iterations are needeed, exit/return
# rinse and repeat

def swap(numbers, index_to_swap_until, debug_mode = false)

  numbers.each_with_index do |number, i|

    puts "\niteration #{i}" if debug_mode == true

    return if number == numbers.last || i == index_to_swap_until # we don't want to compare anything if we're at the last element

    puts "numbers[i + 1] : #{numbers[i + 1]}, numbers[i] : #{numbers[i]}" if debug_mode == true

    if numbers[i + 1] < numbers[i]
      smaller_number = numbers[i + 1]
      bigger_number = numbers[i]
      numbers[i+1] = bigger_number
      numbers[i] = smaller_number
      puts "swapping #{numbers[i]} and #{numbers[i + 1]}" if debug_mode == true
    end

    puts "modified numbers array : #{numbers}" if debug_mode == true
  end
end

def bubble_sort(numbers, debug_mode = false)

  puts " ===== original array : #{numbers} ===== \n\n" if debug_mode == true

  numbers.each_with_index do |number, i|

    index_to_swap_until = numbers.length - 1 - i

    puts "\nnumbers (before swap) : #{numbers}" if debug_mode == true

    swap(numbers, index_to_swap_until, false)

    puts "numbers (after swap) : #{numbers}" if debug_mode == true

    #run checking algorithm
    rerun_required = false
    index_to_check_until = numbers.length - 1
    puts "\nchecking algorithm start\n" if debug_mode == true
    (0..index_to_check_until).each_with_index do |i|
      next if i == index_to_check_until
      puts "number[i] : #{numbers[i]}, numbers[i+1] : #{numbers[i+1]}" if debug_mode == true
      if numbers[i+1] < numbers[i]
        rerun_required = true
        break
      end
    end

    puts "rerun required : #{rerun_required} \n ---------------------\n" if debug_mode == true

    if rerun_required == false
      pp numbers
      return numbers
    end
  end

end

bubble_sort([4,3,78,2,0,2]) # expected => [0,2,2,3,4,78]
bubble_sort([64, 34, 25, 12, 22, 11, 90]) # expected => [11 12 22 25 34 64 90]
bubble_sort([5, 3, 9, 1, 7, 2, 8, 4, 6]) # expected => [1, 2, 3, 4, 5, 6, 7, 8, 9]
bubble_sort([9, 8, 7, 6, 5, 4, 3, 2, 1]) # expected => [1, 2, 3, 4, 5, 6, 7, 8, 9]
bubble_sort([3, 5, 2, 7, 5, 3, 8, 2, 9]) # expected => [2, 2, 3, 3, 5, 5, 7, 8, 9]
bubble_sort([5, -3, 9, -1, 7, 2, -8, 4, -6]) # expected => [-8, -6, -3, -1, 2, 4, 5, 7, 9]
