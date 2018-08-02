def short_long_short(first, second)
  shorter, longer = first.size > second.size ? second : first,
                    first.size > second.size ? first : second
  shorter + longer + shorter
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"