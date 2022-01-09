cards = ["Jack", "Queen", "King", "Ace", "Joker"]


puts "each:"
cards.each do |c|
  puts "#{c.upcase} - #{c.length}"
end

puts "\nshuffle:"

cards.shuffle.each do |c|
  puts "#{c.upcase} - #{c.length}"
end

puts "\nreverse_each:"

cards.reverse_each do |c|
  puts "#{c.upcase} - #{c.length}"
end

puts "Scores in a Hash"
scores = {"Larry": 10 , "Moe": 8, "Curly": 12}

scores.each do |player, score|
  puts "#{player} scored #{score}!"
end