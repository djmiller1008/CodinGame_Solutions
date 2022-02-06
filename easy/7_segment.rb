line_1 = gets.chomp
line_2 = gets.chomp
line_3 = gets.chomp

total = line_1.length / 3
current = 0
number = ""
i = 0

while current < total
    if line_1[(current * 3) + 1] == " "
        # 1 or 4
        if line_2[(current*3)] == " "
            # 1
            number += "1"
            current += 1
        else
            # 4
            number += "4"
            current += 1
        end
    else
        if line_2[(current*3)..((current*3)+2)] == "| |"
            # 0
            number += "0"
            current += 1
        elsif line_2[(current*3)..((current*3)+2)] == "|_|"
            # 8 or 9
            if line_3[(current*3)] == "|"
                # 8
                number += "8"
                current += 1
            else
                # 9
                number += "9"
                current += 1
            end
        elsif line_2[(current*3)..((current*3)+2)] == " _|"
            # 2 or 3
            if line_3[(current*3)] == "|"
                # 2
                number += "2"
                current += 1
            else
                # 3
                number += "3"
                current += 1
            end
        elsif line_2[(current*3)..((current*3)+2)] == "  |"
            # 7
            number += "7"
            current += 1
        else
            # 5 or 6
            if line_3[(current*3)] == "|"
                # 6
                number += "6"
                current += 1
            else
                # 5
                number += "5"
                current += 1
            end
        end
    end
end

puts number
