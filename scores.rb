scores = [83, 71, 92, 64, 98, 87, 75, 69]

high_scores = scores.select { |s| s > 80 }

p high_scores

low_scores = scores.reject { |s| s > 80 }

p low_scores

puts scores.any? { |s| s < 70 }

first_failing = scores.detect { |s| s < 70 }
p first_failing

scores_doubled = scores.map { |s| s * 2 } 
p scores_doubled

total = scores.reduce(:+)
p total

evens, odds = scores.partition { |s| s.even? }
puts "\nEvens"
p evens
puts "\nOdds"
p odds