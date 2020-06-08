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
      @date = DateCode.new(Date.today.strftime("%d%m%y"))
    elsif date.is_a?(DateCode)
      @date = date
    else
      @date = DateCode.new(date)
    end
  end
end
