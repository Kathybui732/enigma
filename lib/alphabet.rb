class Alphabet
  attr_reader :character

  def initialize(character)
    @character = character.downcase
  end
end
