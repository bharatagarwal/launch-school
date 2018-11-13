# problem
# ---

# translate from english to pig latin
# input: string or strings
# output: string or strings
# rule 1: words starting with vowels have an 'ay' appended
# rule 2: words starting with consonants have the consonant moved to the end
# and then have an 'ay' appended

# examples
# ---

# [a]pple -> [a]ppleay
# [e]ar -> [e]aray
# pig -> (p)[i]g -> [i]g(p)ay
# koala -> (k)[o]ala -> [o]ala(k)ay
# ~~~

# chair -> (ch)[a]ir -> [a]ir(ch)ay
# queen -> (qu)[e]en -> [e]en(qu)ay
# square -> s?(qu)[a]re -> [a]re*s*(qu)ay | *any consonant*
# therapy -> (th)[e]rapy -> [e]rapy(th)ay
# thrush -> (thr)[u]sh -> [u]sh(thr)ay
# school -> (sch)[o]ol -> [o]ol(sch)ay
# ~~~

# (y)[e]llow -> [e]llow(y)ay
# [yt]tria -> yttriaay
# (x)[e]non -> [e]non(x)ay
# [xr]ay -> xrayay

class PigLatin
  def self.translate(phrase)
    phrase.split(' ').map do |word|
      translate_word(word)
    end.join(' ')
  end

  def self.translate_word(word)
    if start_with_vowel?(word)
      word + 'ay'
    elsif start_with_consonant?(word)
      consonant_shifted_to_end(word) + 'ay'
    end
  end

  private

  def self.start_with_vowel?(word)
    word.match(/\A[aeiou]|yt|xr/)
  end

  def self.start_with_consonant?(word)
    word.match(/\A[^aeiou]/)
  end


  def self.consonant_shifted_to_end(word)
    consonant_match_data = word.match(/\A([^aeiou]?qu|[^aeiou]+)([aeiou].*)/)
    consonant, rest_of_word = consonant_match_data[1], consonant_match_data[2]
    rest_of_word + consonant
  end
end