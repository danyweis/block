# we create a block to do some debugging

def with_debugging
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end

def with_expectation(num)
  puts "Running test . . ."
  if num == yield
    puts "Passed"
  else
    puts"Failed!"
    puts "Expected #{num}, but got #{yield}"
  end
end



with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end

with_expectation(5) { 2 + 2 }