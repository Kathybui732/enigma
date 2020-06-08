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

  def shift(amount)
    if amount.to_i > 27
      amount.to_i % 27
    else
      amount.to_i
    end
  end
end
