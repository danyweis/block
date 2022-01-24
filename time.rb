# this is a method that can be used to track the time the code needs to run
def time_it(label)
  start_time = Time.now # create a timestamp
  yield # yield to the code that needs to be tracked 
  elapsed_time = Time.now - start_time # create a second timestamp and substracked the first one
  puts "#{label} took #{elapsed_time} seconds"
end

time_it("Sleep") do # <== Block that the time_it methode yields to 
  #custom code
  sleep(1.5) # <== as exemple just make the code sleep 1.5 sec
end