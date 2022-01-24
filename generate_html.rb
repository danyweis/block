# we will generate the opening and closing html tags 
# wanted result => <h1>Breaking News!</h1>

def h1
  print "<h1>"
  print yield
  print "</h1>"
end

def h2
  print "<h2>"
  print yield
  print "<h2>"
end

def tag(tag)
print "\n<#{tag}>"
print yield
print "</#{tag}>"
end


h1 { "Breaking News!" }
h2 { "Massive Ruby Discovery" }

tag(:h1) { "Breaking News!" }
tag(:h2) { "Massive Ruby Discovery" }

tag(:ul) do
  tag(:li) { "It sparkles!"}
  tag(:li) { "It shines!"}
  tag(:li) { "It mesmerizes!"}
end