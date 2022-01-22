class Movie
  attr_reader :title, :rating, :duration

  def initialize(title, rating, duration)
    @title = title
    @rating = rating
    @duration = duration
  end

  def watch
    puts "Watching #{title} - #{rating} (#{duration} mins)"
  end
end

movie1 = Movie.new("Toy Story", "G", 81)
movie2 = Movie.new("Cast Away", "PG", 143)
movie3 = Movie.new("Apollo 13", "PG", 140)
movie4 = Movie.new("Cars", "G", 117)

module MyEnumerable
  def my_select
    new_arr = []
    each do |value|
      new_arr << value if yield(value)
    end
    new_arr
  end

  def my_map
    new_arr = []
    each do |value|
      new_arr << yield(value)
    end
    new_arr
  end
end

class MovieQueue


  include MyEnumerable #to be able to call select on a class object 
  # include Enumerable #to be able to call select on a class object 
  # the Enumerable requiers as well an EACH method to be defined in the class

  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def each
    @movies.each { |movie| yield movie }
  end

  def each_by_rating(rating)
    @movies.select { |m| m.rating == rating }.each { |m| yield m }
  end
end

queue = MovieQueue.new("Friday Night")
queue.add_movie(movie1)
queue.add_movie(movie2)
queue.add_movie(movie3)

queue.each { |movie| movie.watch }
queue.each_by_rating("PG") { |movie| movie.watch } 

# long_movies = queue.select { |m| m.duration > 100 }
long_movies = queue.my_select { |m| m.duration > 100 }
puts "long"
p long_movies

puts "MAP"

titles = queue.my_map { |m| m.title.downcase }
p titles

puts "title with 13"
# p queue.detect { |m| m.title =~ /13/ }