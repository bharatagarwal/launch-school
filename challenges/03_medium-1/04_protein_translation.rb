# problem
# ----

# input: codon or rna strand (string)
# output: codon translation, or rna strand translation (string), or validity

# data structures
# ----

# dictionary format
# hash with amino acid as key and codon as value.

# algorithm
# ---

# make sets of three from given string
# map over array created
# keep converting until encountering STOP.

class InvalidCodonError < StandardError; end

class Translation
  CODON_TRANSLATION = {
    'Methionine'    => %w[AUG],
    'Phenylalanine' => %w[UUU UUC],
    'Leucine'       => %w[UUA UUG],
    'Serine'        => %w[UCU UCC UCA UCG],
    'Tyrosine'      => %w[UAU UAC],
    'Cysteine'      => %w[UGU UGC],
    'Tryptophan'    => %w[UGG],
    'STOP'          => %w[UAA UAG UGA]
  }

  def self.of_codon(codon)
    codon_set = CODON_TRANSLATION.values.select do |set|
                       set.include?(codon)
                     end.flatten
    
    raise InvalidCodonError if codon_set.empty?

    CODON_TRANSLATION.key(codon_set)
  end

  def self.of_rna(strand)
    codons = create_sets_of_three(strand)

    codons.reduce([]) do |protein, codon|
      amino_acid = of_codon(codon)
      return protein if amino_acid == 'STOP'

      protein << amino_acid
    end
  end

  private

  def self.create_sets_of_three(strand)
    strand
      .chars
      .each_slice(3)
      .reduce([]) do |set, codon_chars|
        set << codon_chars.join
      end
    # strand.scan(/.../)
  end
end