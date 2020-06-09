class Christopher
  attr_reader :message,
              :date

  def initialize
    @message = nil
    @date = nil
  end

  def rotation
    @message.size % 4
  end

  def end_lineup
    last_4 = @message.chars.pop(4).map do |letter|
      Alphabet.new(letter).position
    end
  end

  def end_positions
    [123, 101, 110, 100]
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

  def offsets
    @date.offsets.rotate(rotation)
  end

  def key_factors
    [
      [end_lineup[0] - end_positions[0] - offsets[0]],
      [end_lineup[1] - end_positions[1] - offsets[1]],
      [end_lineup[2] - end_positions[2] - offsets[2]],
      [end_lineup[3] - end_positions[3] - offsets[3]]
    ]
  end

  def all_two_digit_keys
    keys = key_factors.flatten.rotate(-rotation).map do |key|
      [key.to_s.rjust(2, "0"), (key+27).to_s.rjust(2, "0"), (key+54).to_s.rjust(2, "0"), (key+81).to_s.rjust(2, "0"), (key+108).to_s.rjust(2, "0")]
    end
    keys.map do |array|
      array.select do |key|
        key.size == 2 && key[0] != "-"
      end
    end
  end

  def first_element(array)
    array.map do |key|
      key[0]
    end
  end

  def second_element(array)
    array.map do |key|
      key[1]
    end
  end

  def a_key
    all_two_digit_keys[0].select do |key|
      first_element(all_two_digit_keys[1]).include?(key[-1])
    end
  end

  def b_key
    all_two_digit_keys[1].select do |key|
      second_element(a_key).include?(key[0]) && first_element(all_two_digit_keys[2]).include?(key[-1])
    end
  end

  def c_key
    all_two_digit_keys[2].select do |key|
      second_element(b_key).include?(key[0]) && first_element(all_two_digit_keys[3]).include?(key[-1])
    end
  end

  def d_key
    all_two_digit_keys[3].select do |key|
      second_element(c_key).include?(key[0])
    end
  end

  def compare_keys(current_keys, previous_key)
    current_keys.select do |number|
      number.end_with?(previous_key[0][0])
    end
  end

  def key_set
    keys = [d_key, c_key, b_key, a_key]
    key_set = []
    keys.each_with_index do |key, index|
      if key.count == 1
        key_set << key
      else
        key = compare_keys(key, keys[index-1])
        key_set << key
      end
    end
    key_set.reverse.flatten!
  end

  def mystery_key
    [key_set[0], key_set[2], key_set[3][1]].join
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

  def shift(key, date)
    offsets = key.shift_keys.zip(date.offsets).map(&:sum)
    shift = Hash.new
    shift[:A] = offsets[0]
    shift[:B] = offsets[1]
    shift[:C] = offsets[2]
    shift[:D] = offsets[3]
    shift
  end

  def crack(message, date=nil)
    @message = message
    @date = date_object(date)
    {
      decryption: decrypt(message, mystery_key, date)[:decryption],
      date: decrypt(message, mystery_key, date)[:date],
      key: decrypt(message, mystery_key, date)[:key]
    }
  end
end
