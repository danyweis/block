def deal(number)

  faces = ["Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]

  score = 0
  1.upto(number) do
    random_face = faces.sample
    random_suit = suits.sample
    if block_given?
      score += yield(random_face, random_suit)
      puts "You scored #{score}!"
    else
      puts "No deal!"
    end
  end
end

deal(5) do |face, suit|
  puts "Dealt a #{face} of #{suit}"
  face.length + suit.length
end 