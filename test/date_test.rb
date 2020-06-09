require_relative "./test_helper"

class DateCodeTest < Minitest::Test

  def setup
    @date_1 = DateCode.new("040895")
  end

  def test_it_exists_with_attributes
    assert_instance_of DateCode, @date_1
    assert_equal "040895", @date_1.code
  end

  def test_it_can_create_offsets
    assert_equal [1, 0, 2, 5], @date_1.offsets
  end
end
