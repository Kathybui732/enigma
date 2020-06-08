require_relative "./test_helper"

class AlphabetTest < MiniTest::Test

	def setup
		@alphabet = Alphabet.new("k")
		@space = Alphabet.new(" ")
		@punctuation = Alphabet.new("!")
		@capitalize = Alphabet.new("K")
	end

  def test_it_exists_with_attributes
    assert_instance_of Alphabet, @alphabet
    assert_equal "k", @alphabet.character
    assert_equal " ", @space.character
    assert_equal "!", @punctuation.character
    assert_equal "k", @capitalize.character
    assert_equal true, @alphabet.character.downcase == @alphabet.character
    assert_equal true, @capitalize.character.downcase == @capitalize.character
  end

  def test_it_has_valid_alphabet
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @alphabet.valid_alphabet
    assert_equal true, @space.valid_alphabet.include?(@space.character)
    assert_equal false, @punctuation.valid_alphabet.include?(@punctuation.character)
    assert_equal true, @capitalize.valid_alphabet.include?(@capitalize.character)
  end

  def test_it_can_get_position
    assert_equal 107, @alphabet.position
    assert_equal 123, @space.position
    assert_equal 33, @punctuation.position
    assert_equal 107, @capitalize.position
  end

  def test_it_can_shift
    assert_equal 26, @alphabet.shift("26")
    assert_equal 0, @space.shift("81")
    assert_equal 5, @punctuation.shift("32")
    assert_equal 26, @capitalize.shift("26")
  end
end
