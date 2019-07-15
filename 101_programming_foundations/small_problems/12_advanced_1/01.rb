text = File.read('dingledodies.txt')

nouns = %w(Paris Jamal cranberry death luck telephone Pamplona life)
verbs = %w(danced flopped kicked thought smite write)
adjectives = %w(neurotic delightful laugh-inducing brilliant terrible)


text.count('NOUN').times do |n|
  text.sub!('NOUN', nouns.sample)
end

text.count('VERB').times do |n|
  text.sub!('VERB', verbs.sample)
end

text.count('ADJECTIVE').times do |n|
  text.sub!('ADJECTIVE', adjectives.sample)
end

p text