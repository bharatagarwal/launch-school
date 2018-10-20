require "pry"

# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

pioneers = <<HEREDOC
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
HEREDOC

pioneers = pioneers.split("\n")

ALPHABET = 'abcdefghijklmnopqrstuvwxyz'.chars + ['-']
SUBSTITUTION = ALPHABET[13..25] + ALPHABET[0..12] + ['-']

def rot13(array)
  array.map do |full_name|
    full_name.split(' ').map do |names|
      names.chars.map do |char|
        char_case = char.upcase == char ? :upcase : :downcase
        SUBSTITUTION[ALPHABET.index(char.downcase)].send(char_case)
      end.join('')
    end.join(' ')
  end
end

puts rot13(pioneers)