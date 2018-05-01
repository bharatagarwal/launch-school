hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.values.each do |value|
  value.each do |v|
    v.chars.each do |char|
      print char if char.match(/[aeiou]/)
    end
  end
end

# 'aeiou'.include?(char)