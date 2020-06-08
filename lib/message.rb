class Message
  attr_reader :content

  def initialize(content)
    @content = content
    @encrypted_content = []
  end

  def breakdown
    snippets = @content.chars.each_slice(4).map(&:join)
    array = snippets.map do |element|
      element.chars
    end
    breakdown = array.map do |array|
      array.map do |letter|
        Alphabet.new(letter)
      end
    end
  end

  def encrypt(shift)
    encrypted_breakdown = []
    breakdown.each do |array|
      a = array[0].encrypt(shift[:A]) unless array[0].nil?
      b = array[1].encrypt(shift[:B]) unless array[1].nil?
      c = array[2].encrypt(shift[:C]) unless array[2].nil?
      d = array[3].encrypt(shift[:D]) unless array[3].nil?
      encrypted_breakdown << [a, b, c, d].compact
    end
    encrypted_breakdown.flatten.join
  end

  def decrypt(shift)
    decrypted_breakdown = []
    breakdown.each do |array|
      a = array[0].decrypt(shift[:A]) unless array[0].nil?
      b = array[1].decrypt(shift[:B]) unless array[1].nil?
      c = array[2].decrypt(shift[:C]) unless array[2].nil?
      d = array[3].decrypt(shift[:D]) unless array[3].nil?
      decrypted_breakdown << [a, b, c, d].compact
    end
    decrypted_breakdown.flatten.join
  end
end
