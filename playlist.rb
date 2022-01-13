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

class Playlist

include Enumerable

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
over3min = playlist.select { |song| song.duration > 3.0}
puts over3min
puts
playlist.each_tagline { |tagline| puts tagline }
puts
playlist.each_by_artist("JayZ") { |song| song.play }
puts
song3.each_file_name { |filenames| puts filenames}
