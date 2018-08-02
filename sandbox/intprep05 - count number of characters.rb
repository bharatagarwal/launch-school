# Please write word or multiple words: walk, don't run

def character_count(string)
  string.chars.count do |char|
    char != ' '
  end
end

p character_count("walk, don't run")