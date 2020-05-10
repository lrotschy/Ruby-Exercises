# Medium_1_4.rb
# self.of_codon(str)
# input: 3 letter string
# output: string translation using table

# self.of_rna(str)
# InvalidCodonError if not a valid
# input: a string with multiple codons
# outut: an array of proteins or error message
# rules
#   - each three letter segment must be included in CODONS or invalid
#   - if codon == 'STOP', return array without finishing
#   - translate each segment to protein and push to array

class InvalidCodonError < StandardError; end

class Translation

  CODONS = {['AUG'] => 'Methionine',
    ['UUU', 'UUC'] => 'Phenylalanine',
    ['UUA','UUG'] => 'Leucine',
    ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
    ['UAU', 'UAC'] => 'Tyrosine',
    ['UGU', 'UGC'] => 'Cysteine',
    ['UGG'] => 'Tryptophan',
    ['UAA', 'UAG', 'UGA'] => 'STOP'
  }

  def self.of_codon(str)
    CODONS.each do |key, value|
      return value if key.include?(str)
    end
  end

  def self.of_rna(str)
    codons = str.scan /.../
    raise InvalidCodonError if codons.any? { |c| !CODONS.keys.flatten.include?(c)}
    Translation.translate(codons)
  end

  # def self.split_strand(str)
    # codons = []
    # start = 0
    # (str.length / 3).times do
    #   codons << str[start..(start + 2)]
    #   start = start + 3
    # end
    # codons

    # codons = []
    # str.chars.each_slice(3) { |c| codons << c.join}
    # codons
  # end

  def self.translate(codons)
    codons.each_with_object([]) do |codon, aminos|
      return aminos if Translation.of_codon(codon) == 'STOP'
      aminos << Translation.of_codon(codon)
    end
  end
end

# p Translation.of_rna('UGGUGUUAUUAAUGGUUU')
# p Translation.of_rna('carrot')

require 'minitest/autorun'
# require_relative 'protein_translation'

# rubocop:disable Style/MethodName
class TranslationTest < Minitest::Test
  def test_AUG_translates_to_methionine
    assert_equal 'Methionine', Translation.of_codon('AUG')
  end

  def test_identifies_Phenylalanine_codons
    #skip
    assert_equal 'Phenylalanine', Translation.of_codon('UUU')
    assert_equal 'Phenylalanine', Translation.of_codon('UUC')
  end

  def test_identifies_Leucine_codons
    #skip
    %w(UUA UUG).each do |codon|
      assert_equal 'Leucine', Translation.of_codon(codon)
    end
  end

  def test_identifies_Serine_codons
  #  skip
    %w(UCU UCC UCA UCG).each do |codon|
      assert_equal 'Serine', Translation.of_codon(codon)
    end
  end

  def test_identifies_Tyrosine_codons
  #  skip
    %w(UAU UAC).each do |codon|
      assert_equal 'Tyrosine', Translation.of_codon(codon)
    end
  end

  def test_identifies_Cysteine_codons
    #skip
    %w(UGU UGC).each do |codon|
      assert_equal 'Cysteine', Translation.of_codon(codon)
    end
  end
  def test_identifies_Tryptophan_codons
  #  skip
    assert_equal 'Tryptophan', Translation.of_codon('UGG')
  end

  def test_identifies_stop_codons
    #skip
    %w(UAA UAG UGA).each do |codon|
      assert_equal 'STOP', Translation.of_codon(codon)
    end
  end

  def test_translates_rna_strand_into_correct_protein
    # skip
    strand = 'AUGUUUUGG'
    expected = %w(Methionine Phenylalanine Tryptophan)
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_stops_translation_if_stop_codon_present
    # skip
    strand = 'AUGUUUUAA'
    expected = %w(Methionine Phenylalanine)
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_stops_translation_of_longer_strand
    # skip
    strand = 'UGGUGUUAUUAAUGGUUU'
    expected = %w(Tryptophan Cysteine Tyrosine)
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_invalid_codons
    # skip
    strand = 'CARROT'
    assert_raises(InvalidCodonError) do
      Translation.of_rna(strand)
    end
  end
end
