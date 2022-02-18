rotors = []
alpha = ("A".."Z").to_a
operation = gets.chomp
pseudo_random_number = gets.to_i
3.times do
    rotors << gets.chomp
end
message = gets.chomp.split("")

if operation == "ENCODE"
    message.each_with_index do |c, i|
        message[i] = alpha[(alpha.index(c) + pseudo_random_number) % 26]
        pseudo_random_number += 1
    end

    rotors.each do |rotor|
        message.each_with_index do |c, i|
            message[i] = rotor[alpha.index(c)]
        end 
    end 
else
    rotors.reverse.each do |rotor|
        message.each_with_index do |c, i|
            message[i] = alpha[rotor.index(c)]
        end
    end

    message.each_with_index do |c, i|
        message[i] = alpha[(alpha.index(c) - pseudo_random_number) % 26]
        pseudo_random_number += 1
    end
end 
puts message.join("")