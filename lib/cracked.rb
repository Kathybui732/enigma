require "./lib/enigma"
require "./lib/key"
require "./lib/date"
require "./lib/alphabet"
require "./lib/message"
require "./lib/decipher"
require "date"

handle = File.open(ARGV[0], "r")
encrypted_test = handle.read

enigma = Enigma.new
decipher = enigma.crack(encrypted_test, ARGV[2])
deciphered_text = decipher[:decryption]
date = decipher[:date]
key = decipher[:key]

writer = File.open(ARGV[1], "w")
writer.write(deciphered_text)

handle.close
writer.close

puts "Created 'cracked.txt' with the key #{key} and date #{date}"
