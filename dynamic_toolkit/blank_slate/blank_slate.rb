require_relative "../blankslate"

class A < BlankSlate; end
#puts A.new
A.reveal(:inspect)
A.new
A.reveal(:to_s)
puts A.new
A.reveal(:methods)
puts A.new.methods