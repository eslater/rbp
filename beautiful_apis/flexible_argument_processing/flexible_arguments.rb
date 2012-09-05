def distance(x1,y1,x2,y2)
  Math.hypot(x2 - x1, y2 - y1)
end

def distance2(*points)
  distance(*points.flatten)
end

def distance3(*points)
  case (points.length)
    when 2
      x1, y1, x2, y2 = points.flatten
    when 4
      x1, y1, x2, y2 = points
    else
      raise ArgumentError,
            "Points may be specified as [x1,y1], [x2,y2] or x1,y1,x2,y2"
  end
  Math.hypot(x2 - x1, y2 - y1)
end

def story(options)
"#{options[:person]} went to town, riding on a #{options[:animal]}"
end

def story2(options={})
options = { person: "Yankee Doodle", animal: "Tiger" }.merge(options)
"#{options[:person]} went to town, riding on a #{options[:animal]}"
end


if __FILE__ == $PROGRAM_NAME
  puts distance(3,3,4,5)
  puts distance2 [3,3], [4,5]
  puts distance2 [3],[3],[4],[5]
  puts distance2 3,3,4,5
  puts distance2 [3,3,4],5

  puts distance3 [3,3,4] rescue nil
  puts distance3 3,3,3,4,5 rescue nil
  puts distance3 [3,3,3,4] rescue nil
  puts distance3 [3,3],[3,4]
  puts distance3 3,3,3,4

  puts story(animal: "Tiger", person: "Yankee Doodle")
  puts story(person: "Yankee Doodle", animal: "Tiger")

  puts story2
  puts story2(person: "Joe Frasier")
  puts story2(animal: "Kitteh")
  puts story2(animal: "Kitteh", person: "Joe Frasier")
end