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
end
