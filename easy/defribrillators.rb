def change_to_float(coord)
    coord[coord.index(',')] = '.'
    coord = coord.to_f
    coord * Math::PI / 180
end

info = []
distances = []
lon = gets.chomp
lat = gets.chomp
lon = change_to_float(lon)
lat = change_to_float(lat)

n = gets.to_i
n.times do
    defib = gets.chomp
    info << defib.split(";")
end

info.each do |arr|
    long, lati = change_to_float(arr[-2]), change_to_float(arr[-1])
    x = (lon - long) * (Math.cos((lat + lati) / 2))
    y = (lat - lati)
    d = (Math.sqrt((x * x) + (y * y))) * 6371
    distances << d
end

index = distances.index(distances.min)

puts info[index][1]