def b16decode(text)
  chars = ''
  ret = ''
  text.each_char do |c|
    chars += c
    if chars.size == 2
      ret += chars.to_i(16).chr
      chars = ''
    end
  end
  ret
end
