require_relative "./test_helper"

class EnigmaTest < MiniTest::Test

	def setup
    @enigma = Enigma.new
		@key = Key.new("02715")
		@date = DateCode.new("040895")
	end

	def test_it_exists
		assert_instance_of Enigma, @enigma
	end
end
