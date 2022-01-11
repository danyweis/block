def roll
  puts "\nStarting method"
  yield if block_given? #<== if we don't give a block yield wont be called
  yield if block_given?
  yield if block_given?
  yield if block_given?
  puts "back in method"
end

# yield wont be called
roll

# yield will be called
roll do 
  number = rand(1..6)
  puts "You rolled #{number}"
end

puts "\n__________"

def rolled 
  puts "Starting the method"
  number = rand(1..6)
  yield "Larry", number
  puts "Back in the method"

end

rolled do |name, number|
  puts "#{name} rolled a #{number}"
end