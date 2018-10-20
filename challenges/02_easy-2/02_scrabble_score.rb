class Scrabble
  REFERENCE = {
    %w[A E I O U L N R S T] => 1,
    %w[D G]                 => 2,
    %w[B C M P]             => 3,
    %w[F H V W Y]           => 4,
    %w[K]                   => 5,
    %w[J X]                 => 8,
    %w[Q Z]                 => 10
  }

  def initialize(word)
    @word = word
  end

  def score
    return 0 unless @word

    clean_up(@word).upcase.chars.reduce(0) do |sum, char|
      sum + REFERENCE[character_group(char)]
    end
  end

  private

  def clean_up(word)
    word.chars.select{ |char| char.match(/[a-z]/i) }.join
  end

  def character_group(character)
    REFERENCE.keys.select do |group|
      group.include?(character)
    end.first
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end