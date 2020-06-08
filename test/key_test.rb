require_relative "./test_helper"

class KeyTest < Minitest::Test

  def setup
		@key = Key.new("02715")
	end

  def test_it_exists_with_attributes
		assert_equal "02715", @key.code
	end

  def test_it_can_create_shift_keys
    assert_equal [2, 27, 71, 15], @key.shift_keys
  end
end
