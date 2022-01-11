puts "TIMES"

def m_times(number)
  i = 0
  while i < number
    yield i
    i += 1
  end
end

m_times(4) { |n| puts "test nr. #{n}"}

class Integer
  def times
    i = 0
    while i < self
      puts "My own times method "
      yield i
      i += 1
    end
  end
end

5.times { |n| puts "test nr. #{n}" }

puts "\nEACH:"

class Array
  def my_each
    i = 0
    while i < self.size
      yield self[i]
      i += 1
    end
    self
  end
end

weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
weekdays.my_each { |day| puts day}