def joinor(arr, separator = ', ', joining_word = 'or')
  arr.reduce("") do |sentence, num|
    sentence += joining_word + ' ' if num == arr.last && arr.size != 1
    sentence += num.to_s
    separator = ' ' if arr.size == 2
    sentence += separator unless num == arr.last
    sentence
  end
end

# def joinor(arr, delimiter=', ', word='or')
#   case arr.size
#   when 0 then ''
#   when 1 then arr.first
#   when 2 then arr.join(" #{word} ")
#   else
#     arr[-1] = "#{word} #{arr.last}"
#     arr.join(delimiter)
#   end
# end

p joinor([1]) == '1'
p joinor([1, 2]) == "1 or 2"
p joinor([1, 2, 3]) == "1, 2, or 3"
p joinor([1, 2, 3], '; ') == "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"
