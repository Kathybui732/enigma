class Key
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def shift_keys
    @code.chars.each_cons(2).reduce([]) do |acc, pair|
      acc << pair.join.to_i
      acc
    end
  end
end
