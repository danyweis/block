exercise = ["situp", "pushup", "chinup"]

1.upto(5) do |n|
  puts "\n"
  exercise.each do |ex| 
    puts "#{n} #{ex}"
  end
end

1.step(9, 2) do |n|
  puts "\n"
  exercise.each do |ex| 
    puts "#{n} #{ex}"
  end
end

puts "\ndesserts in a hash:"
desserts = {"chocolat" => 1.00, "vanilla" => 0.75 , "cinnamon" => 1.25}

desserts.each do |what, price|
  puts "$#{2 * price} for a cup of #{what}."
end