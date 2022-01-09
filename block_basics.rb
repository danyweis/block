3.times do
  puts "Echo!"
end

3.times() {puts "Hello!"}

3.times do |n|
  puts "Turn #{n}"
end

3.times { |n| puts "Again #{n}"}

1.upto(3) { |n| puts "yeahhh #{n}"}

class Order

  attr_reader :email, :total

  def initialize(email, total)
    @email = email
    @total = total
  end

  def to_s
    "#{@email}: #{total}"
  end

end

orders = []
5.times do 
  orders << Order.new("test@hello.com", 10)
end

puts orders

orders = []
5.times do |n|
  orders << Order.new("email_#{n}@times.com", n * 10)
end
puts orders

orders = []
1.upto(5) do |n|
  orders << Order.new("email_#{n}@upto.com", n * 10)
end
puts orders