require "date"

class DateCode < Date
  attr_reader :code

  def initialize(code = DateCode.today.strftime("%d%m%y"))
    @code = code
  end

  def offsets
    year_squared = (@code.to_i)**2
    last_4 = year_squared.digits.reverse.pop(4)
  end
end
