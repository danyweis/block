class Flyer

  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status=:bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end

end

flyers = []

flyers << Flyer.new("Larry", "larry@email.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@email.com", 1000)
flyers << Flyer.new("Curly", "curly@email.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@email.com", 1000)

puts "Frequent flyers"
frequent_flyers = flyers.select { |f| f.miles_flown >= 3000 }
puts frequent_flyers

puts "Not frequent flyers"
not_frequent_flyers = flyers.reject { |f| f.miles_flown >= 3000 }
puts not_frequent_flyers

puts flyers.any? {|f| f.status == :platinum }

first_bronze_flyer = flyers.detect { |f| f.status == :bronze }
puts first_bronze_flyer

platinum_flyers, other_flyers = flyers.partition { |f| f.status == :platinum }


puts "platinum_flyers"
puts platinum_flyers

puts "other_flyers"
puts other_flyers

puts "\nNametags:"
name_tag_array = flyers.map { |f| "#{f.name} (#{f.status.upcase})"}

p name_tag_array

puts "\nKilometers"
kilometers = flyers.map { |f| "#{f.name}: #{f.miles_flown * 1.6} km"}
puts kilometers
total_km = flyers.reduce(0) { |sum, f| sum + (f.miles_flown * 1.6) }
puts "Total: #{total_km}"

total_bronze_flyers = flyers.select{ |f| f.status == :bronze  }.reduce(0) { |sum, km| sum +(km.miles_flown * 1.6)}
puts total_bronze_flyers

most_miles = flyers.max_by { |m| m.miles_flown}
puts most_miles