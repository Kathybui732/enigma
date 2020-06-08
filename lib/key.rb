class Key
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def shift_keys
    shift_keys = []
    @code.chars.each_cons(2) do |pair|
      shift_keys << pair.join.to_i
    end
    shift_keys
  end
end
