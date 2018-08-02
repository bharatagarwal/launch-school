VOWELS = %w(a e i o u)

def remove_vowels(array)
  array.map do |word|
    word.chars.select do |char|
      VOWELS.include?(char.downcase) == false
    end.join('')
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']