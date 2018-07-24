
def substrings_at_start(string)
  substrings = []

  string.chars.each_index do |index|
    substrings << string[0..index]
  end

  substrings
end

def substrings(string)
  size = string.size
  substrings = []

  (0..size - 1).each do |index|
    substrings << substrings_at_start(string[index..-1])
  end

  substrings.flatten
end

def palindromes(string)
  substrings(string).select do |value|
    (value.reverse == value) && (value.size > 1)
  end
end

p palindromes('abcd')
 # == []
p palindromes('madam')
 # == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye')
 # == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes('knitting cassettes') 
# == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]