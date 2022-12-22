big_array = []
message = gets.chomp
output = ""

message.each_char do |char|
    binary = char.unpack('b*')
    binary_array = binary[0].split("")
    array = binary_array.map { |ele| ele.to_i }
    array.pop
    array = array.reverse
    array.each do |ele|
        big_array << ele
    end
end

length = big_array.length

i = 0
until i > length - 1
    count = 0
    if big_array[i] == 1
        count += 1
        (i + 1...length).each do |j|
            if big_array[j] == 1
                count += 1
            else
                break
            end
        end
        output += "0 " + "0" * count 
    end

    if big_array[i] == 0
        count += 1
        (i + 1...length).each do |j|
            if big_array[j] == 0
                count += 1
            else
                break
            end
        end
        output += "00 " + "0" * count
    end

    i += count

    output += " " if i < length
end

puts output