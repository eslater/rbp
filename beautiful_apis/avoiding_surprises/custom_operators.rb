class Inbox
  attr_reader :unread_count

  def initialize
    @messages     = []
    @unread_count = 0
  end

  def <<(msg)
    @unread_count += 1
    @messages << msg
    return self
  end
end

class Tree
  include Comparable
  attr_reader :age

  def initialize(age)
    @age = age
  end

  def <=>(other_tree)
    age <=> other_tree.age
  end
end


if __FILE__ == $PROGRAM_NAME
  i = Inbox.new
  i << "foo" << "bar" << "baz"
  puts i.unread_count

  a = Tree.new(2)
  b = Tree.new(3)
  c = Tree.new(3)
  puts a < b
  puts b == c
  puts c > a
  puts c != a
end