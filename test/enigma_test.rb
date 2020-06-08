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

  def test_it_can_get_a_date_object
    assert_instance_of DateCode, @enigma.date_object("040895")
    assert_instance_of DateCode, @enigma.date_object(nil)
    assert_instance_of DateCode, @enigma.date_object(DateCode.new("040895"))
  end

  def test_it_can_create_a_shift
    expected = ({ :A=>3, :B=>27, :C=>73, :D=>20 })
    assert_equal expected, @enigma.shift(@key, @date)
  end
end
