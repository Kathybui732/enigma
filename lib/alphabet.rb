class Alphabet
  attr_reader :character

  def initialize(character)
    @character = character.downcase
  end

  def valid_alphabet
    ("a".."z").to_a.push(" ")
  end
end
