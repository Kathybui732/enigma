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
end
