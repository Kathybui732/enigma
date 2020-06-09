require "date"
require "./lib/decipher"

class Enigma < Decipher
  attr_reader :key,
              :date

  def initialize
    @key = nil
    @date = nil
  end
  #
  # def key_object(key)
  #   if key.nil?
  #     random_key = rand(00000..99999).to_s.rjust(5, "0")
  #     @key = Key.new(random_key)
  #   elsif key.is_a?(Key)
  #     @key = key
  #   else
  #     @key = Key.new(key)
  #   end
  # end
  #
  # def date_object(date)
  #   if date.nil?
  #     @date = DateCode.new
  #   elsif date.is_a?(DateCode)
  #     @date = date
  #   else
  #     @date = DateCode.new(date)
  #   end
  # end
  #
  # def shift(key, date)
  #   offsets = key.shift_keys.zip(date.offsets).map(&:sum)
  #   shift = Hash.new
  #   shift[:A] = offsets[0]
  #   shift[:B] = offsets[1]
  #   shift[:C] = offsets[2]
  #   shift[:D] = offsets[3]
  #   shift
  # end

  def encrypt(message, key=nil, date=nil)
    message = Message.new(message)
    @key = key_object(key)
    @date = date_object(date)
    {
      encryption: message.encrypt(shift(@key, @date)),
      key: @key.code,
      date: @date.code
    }
    end

  # def decrypt(message, key=nil, date=nil)
  #   message = Message.new(message)
  #   @key = key_object(key)
  #   @date = date_object(date)
  #   {
  #     decryption: message.decrypt(shift(@key, @date)),
  #     key: @key.code,
  #     date: @date.code
  #   }
  # end
  #
  # def crack(message, date=nil)
  #   rotation = message.size % 4
  #   last_4 = message.chars.pop(4)
  #   last_4 = last_4.map do |letter|
  #     Alphabet.new(letter)
  #   end
  #   end_lineup = last_4.map do |alphabet|
  #     alphabet.position
  #   end
  #   end_positions = [123, 101, 110, 100]
  #   @date = date_object(date)
  #   offsets = @date.offsets.rotate(rotation)
  #   potential_keys = [
  #     [end_lineup[0] - end_positions[0] - offsets[0]],
  #     [end_lineup[1] - end_positions[1] - offsets[1]],
  #     [end_lineup[2] - end_positions[2] - offsets[2]],
  #     [end_lineup[3] - end_positions[3] - offsets[3]]
  #   ]
  #   all_keys = potential_keys.flatten.rotate(-rotation).map do |key|
  #     [key.to_s.rjust(2, "0"), (key+27).to_s.rjust(2, "0"), (key+54).to_s.rjust(2, "0"), (key+81).to_s.rjust(2, "0"), (key+108).to_s.rjust(2, "0")]
  #   end
  #   two_digit_keys = all_keys.map do |array|
  #     array.select do |key|
  #       key.size == 2 && key[0] != "-"
  #     end
  #   end
  #
  #   def first_element(array)
  #     array.map do |array_1|
  #       array_1.map do |key|
  #         key[0]
  #       end
  #     end
  #   end
  #
  #   def second_element(array)
  #     array.map do |array_1|
  #       array_1.map do |key|
  #         key[1]
  #       end
  #     end
  #   end
  #
  #   a_key = two_digit_keys[0].select do |key|
  #     first_element(two_digit_keys)[1].include?(key[-1])
  #   end
  #   two_digit_keys[0] = a_key
  #   b_key = two_digit_keys[1].select do |key|
  #     second_element(two_digit_keys)[0].include?(key[0]) && first_element(two_digit_keys)[2].include?(key[-1])
  #   end
  #   two_digit_keys[1] = b_key
  #   c_key = two_digit_keys[2].select do |key|
  #     second_element(two_digit_keys)[1].include?(key[0]) && first_element(two_digit_keys)[3].include?(key[-1])
  #   end
  #   two_digit_keys[2] = c_key
  #   d_key = two_digit_keys[3].select do |key|
  #     second_element(two_digit_keys)[2].include?(key[0])
  #   end
  #
  #   def method(key, past_key)
  #     key.select do |number|
  #       number.end_with?(past_key[0][0])
  #     end
  #   end
  #
  #
  #   keys = [d_key, c_key, b_key, a_key]
  #   final_keys = []
  #   keys.each_with_index do |key, index|
  #     if key.count == 1
  #       final_keys << key
  #     else
  #       key = method(key, keys[index-1])
  #       final_keys << key
  #     end
  #   end
  #   mystery_key = [a_key, c_key, d_key[1]].join
  #   decrypt(message, mystery_key, date)
  # end
end
