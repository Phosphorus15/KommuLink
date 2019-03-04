require './enc/commons.rb'

def passive_mode(len)
	puts "====== Passive communication mode ======"
	puts " Default Cipher : RSA 2048 + AES 256 CBC"
	puts
	puts "Please paste the content received from active user : "
	line = ""
	while ! line.start_with? "-----BEGIN PUBLIC KEY-----" do
		line = readline
	end
	public_key = line
	while ! line.start_with? "-----END PUBLIC KEY-----" do
		line = readline
		public_key += line
	end
	puts
	puts "Public Key Confirmed"
	puts
	cipher = OpenSSL::Cipher::AES.new("256-CBC")
	key = cipher.random_key
	iv = cipher.random_iv
	puts Base64.encode64(key)
	puts Base64.encode64(iv)
	puts "Generated exchange key, copy ALL the content underneath and send it to an active user :"
	puts "Press <Enter> to Continue"
	puts
	rsa_pub = OpenSSL::PKey::RSA.new(public_key) # create public key
	puts "-----BEGIN EXCAHNGE KEY-----"
	base = Base64.encode64(rsa_pub.public_encrypt(key + iv))
	puts base
	puts "-----END EXCAHNGE KEY-----"
	readline
	puts
	cipher.decrypt
	cipher.key = key
	cipher.iv = iv
	puts "Key exchange finished, start chatting !"
	puts "paste the messages you received underneath :"
	while true do
		line = readline
		puts cipher.update(Base64.strict_decode64(line.strip)) + cipher.final
	end
end
