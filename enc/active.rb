def active_mode(len)
	puts "====== Active communication mode ======"
	puts " Default Cipher : RSA 2048 + AES 256 CBC"
	puts
	puts "Please copy ALL the content underneath and send it to a passive mode user"
	puts "Press <Enter> to Continue"
	puts
	rsa = OpenSSL::PKey::RSA.new(len)
	puts rsa.public_key.to_pem
	readline
	puts "Input the Exchanged key from passive mode user : "
	line = ""
	exchange_key = ""
	while ! line.start_with? "-----BEGIN EXCAHNGE KEY-----" do
		line = readline
	end
	while ! line.start_with? "-----END EXCAHNGE KEY-----" do
		line = readline
		exchange_key += line if ! line.start_with? "-----END EXCAHNGE KEY-----"
	end
	exchange_key = exchange_key
	key = rsa.private_decrypt(Base64.decode64(exchange_key))
	raise "Malformed padding" if key.size != 48
	iv = key[32..-1]
	key = key[0..31]
	puts Base64.encode64(key)
	puts Base64.encode64(iv)
	cipher = OpenSSL::Cipher::AES.new("256-CBC")
	cipher.encrypt
	cipher.key = key
	cipher.iv = iv
	puts
	puts "Key exchange finished, start chatting !"
	puts "Input message :"
	while true do
		line = readline
		puts Base64.strict_encode64(cipher.update(line) + cipher.final)
	end
end