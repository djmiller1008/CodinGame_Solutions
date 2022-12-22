players = Hash.new { |h, k| h[k] = [] }
n = gets.to_i
n.times do
    numplayer, signplayer = gets.split(" ")
    numplayer = numplayer.to_i
    player = [numplayer, signplayer]
    players[player] = []
end

def round(players)
    people = players.keys
    i = 0
    (players.length / 2).times {
        p1sign = people[i][1]
        p2sign = people[i + 1][1]
        if p1sign == "C" && (p2sign == "P" || p2sign == "L")
            players[people[i]] << people[i + 1][0]
            players.delete(people[i + 1])
        elsif p1sign == "R" && (p2sign == "L" || p2sign == "C")
            players[people[i]] << people[i + 1][0]
            players.delete(people[i + 1])
        elsif p1sign == "P" && (p2sign == "R" || p2sign == "S")
            players[people[i]] << people[i + 1][0]
            players.delete(people[i + 1])
        elsif p1sign == "L" && (p2sign == "S" || p2sign == "P")
            players[people[i]] << people[i + 1][0]
            players.delete(people[i + 1])
        elsif p1sign == "S" && (p2sign == "C" || p2sign == "R")
            players[people[i]] << people[i + 1][0]
            players.delete(people[i + 1])
        elsif p1sign == p2sign
            if people[i][0] < people[i + 1][0]
                players[people[i]] << people[i + 1][0]
                players.delete(people[i + 1])
            else
                players[people[i + 1]] << people[i][0]
                players.delete(people[i])
            end
        else
            players[people[i + 1]] << people[i][0]
            players.delete(people[i])
        end
        i += 2
    }
   players
end

until players.length == 1
    players = round(players)
end

puts players.keys[0][0]
puts players.values.join(" ")