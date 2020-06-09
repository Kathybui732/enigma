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

	def test_it_can_encrypt_message_with_a_key_and_date
		expected = {
			:encryption=>"keder,sprrdx!",
			:key=>"02715",
			:date=>"040895"
		}
		assert_equal expected, @enigma.encrypt("Hello, world!", "02715", "040895")
	end

	def test_it_can_encrypt_with_todays_date
		expected = {
			:encryption=>"nib u,qkuvbs!",
			:key=>"02715",
			:date=>"070620"
		}
		@enigma.stubs(:date_object).returns(DateCode.new("070620"))
		@enigma.stubs(:shift).returns({:A=>6, :B=>31, :C=>71, :D=>15})
		assert_equal expected, @enigma.encrypt("hello, world!", "02715")
	end

	def test_it_can_encrypt_with_no_key_or_date
		expected = {
			:encryption=>"nib u,qkuvbs!",
			:key=>"02741",
			:date=>"070620"
		}
		@enigma.stubs(:date_object).returns(DateCode.new("070620"))
		@enigma.stubs(:shift).returns({:A=>6, :B=>31, :C=>71, :D=>15})
		@enigma.stubs(:key_object).returns(Key.new("02741"))
		assert_equal expected, @enigma.encrypt("hello, world!")
	end

	def test_it_can_decrypt_message_with_a_key_and_date
		expected = {
			:decryption=>"hello,hveutc!",
			:key=>"02715",
			:date=>"040895"
		}
		assert_equal expected, @enigma.decrypt("keder, ohulw!", "02715", "040895")
	end

	def test_it_can_decrypt_with_todays_date
		encrypted = @enigma.encrypt("hello, world!", "02715")
		expected = {
			:decryption=>"hello, world!",
			:key=>"02715",
			:date=>"070620"
		}
		@enigma.stubs(:date_object).returns(DateCode.new("070620"))
		@enigma.stubs(:shift).returns({:A=>6, :B=>31, :C=>71, :D=>15})
		assert_equal expected, @enigma.decrypt(encrypted[:encryption], "02715")
	end

	def test_crack_with_a_date
		@enigma.encrypt("hello world end", "08304", "291018")
		expected = {
	    decryption: "hello world end",
	    date: "291018",
	    key: "08304"
  	}
		assert_equal expected, @enigma.crack("vjqtbeaweqihssi", "291018")
	end

	def test_crack_with_todays_date
		message = "kath end"
		encryption = @enigma.encrypt(message, "93652", "080620")
		# {:encryption=>" ndfpryb", :key=>"93652", :date=>"080620"}
		cracked = @enigma.crack(" ndfpryb")
	end
end
