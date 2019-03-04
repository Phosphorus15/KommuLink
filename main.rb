require 'openssl'
require 'base64'
require 'securerandom'
require "digest/sha2"
require './enc/active.rb'
require './enc/passive.rb'


len = 2048

heredoc = <<EOF
Welcome use :

888    d8P                                                     888      d8b          888      
888   d8P                                                      888      Y8P          888      
888  d8P                                                       888                   888      
888d88K      .d88b.  88888b.d88b.  88888b.d88b.  888  888      888      888 88888b.  888  888 
8888888b    d88""88b 888 "888 "88b 888 "888 "88b 888  888      888      888 888 "88b 888 .88P 
888  Y88b   888  888 888  888  888 888  888  888 888  888      888      888 888  888 888888K  
888   Y88b  Y88..88P 888  888  888 888  888  888 Y88b 888      888      888 888  888 888 "88b 
888    Y88b  "Y88P"  888  888  888 888  888  888  "Y88888      88888888 888 888  888 888  888 
                                                                                             
Test version, do not distribute

EOF
puts heredoc
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
