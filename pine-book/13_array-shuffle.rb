class Array
    def shuffle
    shuffle_method(self, [])
  end

  def shuffle_method array, shuffled
    while array.length > 0
      rand_num = rand(array.length)
      shuffled.push(array[rand_num])
      array.delete_at(rand_num)
    end
    shuffled
  end
end

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

print numbers.shuffle