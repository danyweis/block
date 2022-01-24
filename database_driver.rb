
class DatabaseDriver
  def initialize(database, user, password)
    @database = database
    @user = user
    @password = password
    @connected = false

  end

  def self.open(database, user, password)
    driver = self.new(database, user, password)
    driver.connect
    
    return driver unless block_given?

    begin
      yield(driver)
    rescue Exception => e
      puts e.message
    ensure
      driver.disconnect
    end
  end

  def connect
    # connects to database
    @connected = true
    puts "Connected to #{@database} as #{@user}."
  end

  def disconnect
    # disconnects from database
    puts "Disconnected."
  end

  def execute(sql)
    raise "Not connected!" unless @connected
    puts "Executing #{sql}..."
    # executes SQL
  end

end


driver = DatabaseDriver.open("my_database", "admin", "secret")

driver.connect
driver.execute("SELECT * FROM merchants")
driver.execute("SELECT * FROM gift_cards")
driver.disconnect

DatabaseDriver.open("second_database", "danyCode", "password") do |driver|
  driver.execute("SELECT * FROM merchants")
  raise "Boom"
  driver.execute("SELECT * FROM gift_cards")
end