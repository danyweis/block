class Song
  attr_reader :name, :artist, :duration

  def initialize(name,artist,duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)"
  end

  def each_file_name
    filenames = [".mp3", ".wav", ".aac"] 
      filenames.length.times do |t|
        # yield"#{t} #{filenames[t]}"
        yield "#{name} #{artist}#{filenames[t]}".downcase.gsub(" ", "-")
      end
  end
  # def each_filename
  #   basename = "#{name}-#{artist}".gsub(" ", "-").downcase
  #   extensions = [".mp3", ".wav", ".aac"]
  #   extensions.each { |ext| yield basename + ext }
  # end

end

song1 = Song.new("Paris", "JayZ", 3.47)
song2 = Song.new("Stan", "Eminem", 2.56)
song3 = Song.new("Run the world", "Beyonce", 5.03)
song4 = Song.new("LaLisa", "Lisa", 3.29)

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

  def my_reject
    new_arr = []
    each do |value|
      new_arr << value unless yield(value)
    end
    new_arr
  end

  def my_detect
    # new_arr = []
    each do |value|
      return value if yield(value)
    end
    nil
  end 

  def my_any?
    # new_arr = []
    each do |value|
      return true if yield(value)
    end
  false
  end

  def my_reduce(num=0)
    val = num
    each do |value|
      val = yield(val, value)
    end
    val
  end

end

class Playlist

  include MyEnumerable
# include Enumerable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each 
    @songs.each { |s| yield s }
  end

  def play_song
    @songs.each { |s| s.play }
  end

  def each_tagline
    @songs.each do |s| 
      yield "#{s.name} - #{s.artist}"
    end 
  end

  def each_by_artist(artist)
    @songs.select { |s| s.artist == artist }.each{ |s| yield s}
  end

end

playlist = Playlist.new("Favorites Songs")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)

playlist.each { |s| s.play }
puts
playlist.play_song
puts
over3min = playlist.my_select { |song| song.duration > 3.0}
puts over3min
puts
playlist.each_tagline { |tagline| puts tagline }
puts
playlist.each_by_artist("JayZ") { |song| song.play }
puts
song3.each_file_name { |filenames| puts filenames}

puts
song_labels = playlist.my_map { |song| "#{song.name} => #{song.artist}" }
puts song_labels

puts 
no_paris_song = playlist.my_reject { |song| song.name =~ /Paris/}
p no_paris_song

p playlist.my_detect { |song| song.artist == "Eminem"}
p playlist.my_any? { |song| song.artist == "Eminem"}

puts "reduce:"
total_duration = playlist.my_reduce(0) { |sum, song| sum + song.duration }
p total_duration