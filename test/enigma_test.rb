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

  def test_it_can_get_a_key_object
    assert_instance_of Key, @enigma.key_object("02715")
    assert_instance_of Key, @enigma.key_object(nil)
    assert_instance_of Key, @enigma.key_object(Key.new("02715"))
  end
end
