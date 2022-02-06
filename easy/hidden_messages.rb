bits = ""
w, h = gets.split(" ").collect { |x| x.to_i }
h.times do
    inputs = gets.split(" ")

    for j in 0..(w-1)
        pixel = inputs[j].to_i
        bits += pixel.to_s(2)[-1]
    end
end
bytes = []
byte = ""
bits.each_char do |c|
    byte += c
    if byte.length > 7
        bytes << byte
        byte = ""
    end
end
message = ""
bytes.each do |byte|
    byte = byte.to_i(2)
    message += byte.chr
end

puts message