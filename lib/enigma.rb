require "date"

class Enigma
  attr_reader :key,
              :date

  def initialize
    @key = nil
    @date = nil
  end

  def key_object(key)
    if key.nil?
      random_key = rand(00000..99999).to_s.rjust(5, "0")
      @key = Key.new(random_key)
    elsif key.is_a?(Key)
      @key = key
    else
      @key = Key.new(key)
    end
  end

  def date_object(date)
    if date.nil?
      @date = DateCode.new
    elsif date.is_a?(DateCode)
      @date = date
    else
      @date = DateCode.new(date)
    end
  end

  def shift(key, date)
    offsets = key.shift_keys.zip(date.offsets).map(&:sum)
    shift = Hash.new
    shift[:A] = offsets[0]
    shift[:B] = offsets[1]
    shift[:C] = offsets[2]
    shift[:D] = offsets[3]
    shift
  end

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

  def decrypt(message, key=nil, date=nil)
    message = Message.new(message)
    @key = key_object(key)
    @date = date_object(date)
    {
      decryption: message.decrypt(shift(@key, @date)),
      key: @key.code,
      date: @date.code
    }
  end

  def crack(message, date)
    rotation = message.size % 4
    last_4 = message.chars.pop(4)
    last_4 = last_4.map do |letter|
      Alphabet.new(letter)
    end
    end_lineup = last_4.map do |alphabet|
      alphabet.position
    end
    end_positions = [123, 101, 110, 100]
    @date = date_object(date)
    offsets = @date.offsets.rotate(rotation)
    potential_keys = [
      [end_lineup[0] - end_positions[0] - offsets[0]],
      [end_lineup[1] - end_positions[1] - offsets[1]],
      [end_lineup[2] - end_positions[2] - offsets[2]],
      [end_lineup[3] - end_positions[3] - offsets[3]]
    ]
    all_keys = potential_keys.flatten.rotate(-3).map do |key|
      [key.to_s.rjust(2, "0"), (key+27).to_s.rjust(2, "0"), (key+54).to_s.rjust(2, "0"), (key+81).to_s.rjust(2, "0"), (key+108).to_s.rjust(2, "0")]
    end
    a_key = all_keys[0].find do |key|
      all_keys[1].any? do |element|
        key[1] == element[0]
      end
    end
    b_key = all_keys[1].find do |key|
      all_keys[2].any? do |element|
        key[1] == element[0]
      end
    end
    c_key = all_keys[2].select do |key|
      all_keys[3].any? do |element|
        key[1] == element[0]
      end
    end
    require "pry"; binding.pry
  end
end
