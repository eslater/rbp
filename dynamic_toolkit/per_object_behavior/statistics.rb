class Statistics
  def self.stat(attribute, value)
    define_method(attribute) { value }
  end

  stat :foo, :bar
  stat :baz, :quux
end

if __FILE__ == $PROGRAM_NAME
  stats = Statistics.new
  puts stats.foo #=> :bar
  puts stats.baz #=> :quux
end