require "./lib/enigma"
require "./lib/key"
require "./lib/date"
require "./lib/alphabet"
require "./lib/message"
require "date"

handle = File.open(ARGV[0], "r")

encrypted_text = handle.read

enigma = Enigma.new

decrypted_text = enigma.decrypt(encrypted_text, ARGV[2], ARGV[3])[:decryption]

writer = File.open(ARGV[1], "w")

writer.write(decrypted_text)

handle.close
writer.close

puts "Created 'encrypted.txt' with the key #{ARGV[2]} and date #{ARGV[3]}"
