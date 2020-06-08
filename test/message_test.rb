require_relative "./test_helper"

class MessageTest < Minitest::Test

	def setup
		@message = Message.new("Hello, world!")
		@encrypted_message = Message.new("keder,sprrdx!")
	end

	def test_it_exists_with_attributes
    assert_instance_of Message, @message
		assert_equal "Hello, world!", @message.content
	end

  def test_it_can_breakdown_the_message
		all_obj = @message.breakdown.all? do |array|
			array.all? do |element|
				element.is_a?(Alphabet)
			end
		end
		assert_equal true, all_obj
		assert_equal 4, @message.breakdown.count
	end

end
