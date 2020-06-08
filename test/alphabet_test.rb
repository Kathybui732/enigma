require_relative "./test_helper"

class AlphabetTest < MiniTest::Test

	def setup
		@alphabet = Alphabet.new("k")
		@space = Alphabet.new(" ")
		@punctuation = Alphabet.new("!")
		@capitalize = Alphabet.new("K")
	end
end
