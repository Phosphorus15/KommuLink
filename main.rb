require 'openssl'
require 'base64'
require 'securerandom'
require "digest/sha2"
require './enc/active.rb'
require './enc/passive.rb'


len = 2048

puts "Select Communication Mode : "
puts " 1) Active"
puts " 2) Passive"
puts
sel = 0

while sel < 1 || sel > 2 do
 print "Enter mode number : "
 sel = readline().to_i
end

if sel == 1
 active_mode(len)
else
 passive_mode(len)
end
