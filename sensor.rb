class Sensor
  def temperature
    rand(100..200) # <== just create random values to work with
  end

  def level
    rand(1..5) # <== just create random values to work with
  end
end

sendor = Sensor.new # <== create a new sensor

def checking(description)
  puts "Checking water #{description}."
  result = yield
  if result # <== if true
    puts "OK"
  else #<== else it is false
    puts "FAILED!"
  end
end

checking("temperature") {sendor.temperature < 150}
checking("level") {sendor.level > 3}

# puts "Checking water temperature."
# result = sendor.temperature < 150 # <== we get a random temp and check if it is smaller than 150. result is true or false 
# if result # <== if true (less 150)
#   puts "OK"
# else #<== else it is false (more or equal 150)
#   puts "FAILED!"
# end

# puts "Checking water level."
# result = sendor.level > 3 # <== we get a random level and check if it is over 3. result is true or false 
# if result # <== if true (over 3)
#   puts "OK"
# else #<== else it is false (less or equal 3)
#   puts "FAILED!"
# end