n = gets.to_i
inputs = gets.split(" ")
x = []
for i in 0..(n-1)
    x << inputs[i].to_i
end
cost = 0
current_card = 0
(n-1).times do 
    x = x.sort
    current_card = x[0] + x[1]
    cost += current_card
    x.shift
    x.shift
    x.push(current_card)
end




puts cost
