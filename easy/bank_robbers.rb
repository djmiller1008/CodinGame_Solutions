r = gets.to_i
v = gets.to_i
vault_comb = []

v.times do
    c, n = gets.split(" ").collect { |x| x.to_i }
    total = (10 ** n) * (5 ** (c - n))
    vault_comb << total
end

count = 0
until vault_comb == []
    min = vault_comb.min
    minimum = true
    vault_comb.each_with_index do |vault, i|
        if r >= i + 1
            if vault_comb[i] >= min
                vault_comb[i] -= min
            else
                vault_comb[i] -= 1
                minimum = false
            end
        end
    end
    vault_comb.each_with_index do |vault, i|
        if vault_comb[i] == 0
            vault_comb.delete_at(i)
        end
    end
    if minimum == true
        count += min 
    else
        count += 1
    end
end

puts count