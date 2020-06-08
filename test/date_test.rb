require_relative "./test_helper"

class DateCodeTest < Minitest::Test

	def setup
		@date_1 = DateCode.new("040895")
	end

  def test_it_exists_with_attributes
    assert_equal "040895", @date_1.code
  end
end
