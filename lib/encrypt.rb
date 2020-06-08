require "./lib/enigma"
require "./lib/key"
require "./lib/date"
require "./lib/alphabet"
require "./lib/message"

handle = File.open(ARGV[0], "r")

message = handle.read


enigma = Enigma.new
encryption = enigma.encrypt(message)

encrypted_text = encryption[:encryption]
key = encryption[:key]
date = encryption[:date]

writer = File.open(ARGV[1], "w")

writer.write(encrypted_text)

handle.close
writer.close

puts "Created 'encrypted.txt' with the key #{key} and date #{date}"
