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