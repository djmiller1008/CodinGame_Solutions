array = []
extensions = []
hash = Hash.new
n = gets.to_i # Number of elements which make up the association table.
q = gets.to_i # Number Q of file names to be analyzed.
n.times do
    # ext: file extension
    # mt: MIME type.
    ext, mt = gets.split(" ")
    hash[ext] = mt
end
q.times do
    fname = gets.chomp # One file name per line.
    array << fname
end

array.each_with_index do |file, i|
    added = false
    (1..file.length).each do |j|
        if file[-j] == "." && j != 1
            extensions << file[-j + 1..-1]
            added = true
            break
        end
    end
    if added == false
        extensions << file + "incorrect"
    end
end
hash = hash.transform_keys(&:downcase)

extensions.each do |ext|
    if hash.include?(ext.downcase)
        puts hash[ext.downcase]
    else
        puts "UNKNOWN"
    end
end
