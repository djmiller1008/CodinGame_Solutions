fenceLength = gets.to_i
paintedSections = gets.to_i.times.map {
    gets.split.map(&:to_i)
}
p paintedSections
paintedSections << [fenceLength, 0]
missingSections = []
start = 0
paintedSections.each { |section|
    stop = [start, section[0]].max
    missingSections << "#{start} #{stop}" if stop - start > 0
    start = [section[1], stop].max
}
puts missingSections.any? ? missingSections : "All painted"