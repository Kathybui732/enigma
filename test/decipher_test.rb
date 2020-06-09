require_relative "./test_helper"

class DecipherTest < Minitest::Test

  def setup
    @decipher = Decipher.new
  end

  def test_it_exists_with_attributes
    assert_instance_of Decipher, @decipher
    assert_nil nil, @decipher.message
    assert_nil nil, @decipher.date
  end

  def test_it_has_a_rotation
    @decipher.crack(" ndfpryb")
    assert_equal 0, @decipher.rotation
  end

  def test_it_can_get_four_end_lineup
    @decipher.crack(" ndfpryb")
    @decipher.stubs(:date).returns("080620")
    assert_equal [112, 114, 121, 98], @decipher.end_lineup
  end

  def test_it_can_get_end_positions
    @decipher.crack(" ndfpryb")
    assert_equal [123, 101, 110, 100], @decipher.end_positions
  end

  def test_it_can_get_offsets
    @decipher.crack(" ndfpryb")
    assert_equal [4, 4, 0, 0], @decipher.offsets
  end

  def test_it_can_get_key_factors
    @decipher.crack(" ndfpryb")
    assert_equal [[-15], [9], [11], [-2]], @decipher.key_factors
  end

  def test_all_two_digit_keys
    @decipher.crack(" ndfpryb")
    expected = [["12", "39", "66", "93"], ["09", "36", "63", "90"], ["11", "38", "65", "92"], ["25", "52", "79"]]
    assert_equal expected, @decipher.all_two_digit_keys
  end

  def test_first_element
    all_two_digit_keys = ["12", "39", "66", "93"]
    expected = ["1", "3", "6", "9"]
    assert_equal expected, @decipher.first_element(all_two_digit_keys)
  end

  def test_second_element
    all_two_digit_keys = ["12", "39", "66", "93"]
    expected = ["2", "9", "6", "3"]
    assert_equal expected, @decipher.second_element(all_two_digit_keys)
  end

  def test_a_key
    @decipher.crack(" ndfpryb")
    assert_equal ["39", "66", "93"], @decipher.a_key
  end

  def test_b_key
    @decipher.crack(" ndfpryb")
    assert_equal ["36", "63"], @decipher.b_key
  end

  def test_c_key
    @decipher.crack(" ndfpryb")
    assert_equal ["65"], @decipher.c_key
  end

  def test_d_key
    @decipher.crack(" ndfpryb")
    assert_equal ["52"], @decipher.d_key
  end

  def test_compare_keys
    @decipher.crack(" ndfpryb")
    assert_equal ["36"], @decipher.compare_keys(["36", "63"], ["65"])
  end

  def test_key_set
    @decipher.crack(" ndfpryb")
    assert_equal ["93", "36", "65", "52"], @decipher.key_set
  end

  def test_mystery_key
    @decipher.crack(" ndfpryb")
    assert_equal "93652", @decipher.mystery_key
  end

  def crack
    assert_equal "kath end", @deciper.crack(" ndfpryb")
  end
end
