def three_times
  1.upto(3) do |n|
    yield(n)
  end
end

three_times { puts "Ho!" }

three_times do |number|
  puts "#{number} situp"
  puts "#{number} pushup"
  puts "#{number} chinup"
end

puts "*************"

def n_times(number)
  1.upto(number) do |n|
    yield(n)
  end
end

n_times(5) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end

# for Ruby 2.0:

def progress
  0.step(100, 10) do |number|
    yield number
  end
end

# for Ruby 2.1:

# def progress
#   0.step(by: 10, to: 100) do |number|
#     yield number
#   end
# end

progress { |percent| puts percent }
