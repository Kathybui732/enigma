require_relative "./test_helper"

class KeyTest < Minitest::Test

  def setup
		@key = Key.new("02715")
	end

  def test_it_exists_with_attributes
		assert_equal "02715", @key.code
	end
end
