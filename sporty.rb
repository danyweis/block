class SportyClient
  def post(message)
    raise "Not signed in!" unless @user
    #post message to remote service
    puts "#{@user} posted message: #{message}"
  end

  def timeline
    raise "Not signed in!" unless @user
    #get timeline from remote service
    puts "#{@user} fetched timeline..."
  end

  def sign_in(user)
    # sign in to remote service
    @user = user
    puts "#{user} signed in."
  end

  def sign_out(user)
    # sign out of remote service
    puts "#{user} signed out!"
  end

  def as_signed_in_user(user)
    self.sign_in(user)
    begin 
      yield
    rescue Exception => e
      puts e.message
    ensure
      self.sign_out(user)
    end
  end
end 


client = SportyClient.new

# client.sign_in("danycode")
# client.post("Hey guys I'm back")
# client.post("What's new?")
# client.timeline
# client.sign_out("danycode")

client.as_signed_in_user("danycode") do
  client.post("Hey guys I'm back")
  client.post("What's new?")
  raise "Boooommm!!!"
  client.timeline
end

client2 = SportyClient.new

client2.as_signed_in_user("seahawker") do
  client2.post("Not if we can help it...")
  raise "Boo! Hiss!"
end