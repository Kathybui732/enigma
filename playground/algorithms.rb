require "date"

# Message manipulation
x = "hello, world"
x = x.chars.each_slice(4)
y = x.map(&:join)
a = y.map do |element|
  element.chars
end
 # =>[["h", "e", "l", "l"], ["o", ",", " ", "w"], ["o", "r", "l", "d"]]
#----------------------------------------------------------------------

# Key manipulation

a = "45721"
array = []
b = a.chars.each_cons(2) do |pair|
  array << pair
end
# => [["4", "5"], ["5", "7"], ["7", "2"], ["2", "1"]]
c = array.map do |pair|
  pair.join
end
# => ["45", "57", "72", "21"]

#####OR#####

d = array.map do |pair|
  pair.join.to_i
end
# => [45, 57, 72, 21]

 random_number = rand(00000..99999).to_s.rjust(5, "0")
 # l = random_number.to_s.rjust(5, "0")

#----------------------------------------------------------------------

# Date manipulation

"DDMMYY"
date = Date.today.strftime("%d%m%y")

# - all of 2020's date end in x400
year_squared = (date.to_i)**2
last_4 = year_squared.digits.pop(4)

#----------------------------------------------------------------------

# Alphabet
alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
# "a".ord == 97
# "z".ord == 122
# " ".ord == 32
# if ("a".."z").include?(character)
#   letter.ord.rotate(shift)
# elsif letter == " "
#   (letter.ord + 65).rotate(shift)
# end

#----------------------------------------------------------------------

g = [1, 2, 3, 4]
h = [5, 6, 7, 8]
i = g.zip(h).map(&:sum)

require "pry"; binding.pry

#----------------------------------------------------------------------

# cat

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

puts incoming_text

capitalize_text = incoming_text.upcase

writer = File.open(ARGV[1], "w")

writer.write(capitalize_text)

writer.close
