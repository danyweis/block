require 'timeout'

# Timeout.timeout(2.0) do
#   sleep 3.0
#   puts "That was refreshing ..."
# end

def try_with_timeout(max_time)
  begin
    Timeout.timeout(max_time) do
      yield
    end
  rescue Timeout::Error
    puts "Took to long!"
  end
end

try_with_timeout(2.0) do
  sleep 3.0
  puts "That was refreshing ..."
end


require 'open-uri'

web_page = try_with_timeout(1.0) do
  URI.open("http://atento.me/")
end

puts web_page.read