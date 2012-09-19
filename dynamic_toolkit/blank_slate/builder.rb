require 'builder'
require 'blankslate'

builder = Builder::XmlMarkup.new(:target=>STDOUT, :indent=>2)
builder.person { |b| b.name("Jim"); b.phone("555-1234") }

puts Object.methods.count

puts "BasicObject"
puts BasicObject.instance_methods.sort.inspect
puts BasicObject.methods.sort.inspect
puts "BlankSlate"
puts BlankSlate.instance_methods.sort.inspect
puts BlankSlate.methods.sort.inspect

