class Flyer

  attr_reader :name, :email, :miles_flown

  def initialize(name, email, miles_flown)
    @name = name
    @email = email
    @miles_flown = miles_flown
  end

  def to_s
    "#{name} (#{email}): #{miles_flown}"
  end

end

flyers = []

1.upto(5) do |n|
  flyers << Flyer.new("Flyer #{n}", "flyer#{n}@email.com", n * 1000)
end

puts "print the to_s from the just created object:"
puts flyers

puts "\nPrint Name and miles:"
flyers.each do |f|
  puts "#{f.name} - #{f.miles_flown} miles"
end

total_miles = 0
flyers.each do | m | 
  total_miles += m.miles_flown
end

puts "\nTotal miles flown: #{total_miles}"

puts "\nHashed airlines with multiplyer:"

promotions = {"United": 1.5, "Delta": 2.0, "Lufthansa": 2.5}

promotions.each do |airline, points|
  puts "Earn #{points}x miles by flying #{airline} !"
end

puts "\nHow many miles everybody could get with each airlines:"

flyers.each do |f|
  promotions.each do |a, p|
    puts "#{f.name} could earn #{p * f.miles_flown} miles by flying #{a}!"
  end
end