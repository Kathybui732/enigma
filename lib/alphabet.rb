class Alphabet
  attr_reader :character

  def initialize(character)
    @character = character.downcase
  end

  def valid_alphabet
    ("a".."z").to_a.push(" ")
  end

  def position
    if @character == " "
      (@character.ord + 91)
    else
      @character.ord
    end
  end
end
