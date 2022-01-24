class Application

  attr_accessor :enviroment

  def initialize
    @enviroment = :development
  end

  def connect_to_database
    puts "Connecting to #{@enviroment} database ..."
  end

  def handle_request
    puts "Handeling #{@enviroment} request..."
  end

  def write_to_log
    puts "Writing to #{@enviroment} log file ..."
  end

  def in_environment(env)
    old_env = @enviroment
    @enviroment = env
    yield

  rescue Exception => e
    puts e.message
    ensure
      @enviroment = old_env
      puts "back in #{@enviroment} mode"
    
  end

end

app = Application.new
app.connect_to_database
app.handle_request
app.write_to_log

puts

# app.in_production do
#   app.connect_to_database
#   app.handle_request
#   raise "Boom!"
#   app.write_to_log
# end

app.in_environment(:production) do
  app.connect_to_database
  app.handle_request
  app.write_to_log
end

app.in_environment(:test) do
  app.connect_to_database
  app.handle_request
  app.write_to_log
end