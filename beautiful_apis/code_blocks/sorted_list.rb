class SortedList
  include Enumerable

  def initialize
    @data = []
  end

  def <<(element)
    (@data << element).sort!
  end

  def each
    @data.each { |e| yield(e) }
  end

  def inspect
    @data.inspect
  end

  def report(head)
    header = "#{head}\n#{'-'*head.length}"
    body   = map { |e| yield(e) }.join("\n") + "\n"
    footer = "This report was generated at #{Time.now}\n"
    [header, body, footer].join("\n")
  end
end

if __FILE__ == $PROGRAM_NAME
  a = SortedList.new
  a << 4
  puts a.inspect
  a << 5
  puts a.inspect
  a << 1
  puts a.inspect
  a << 7
  puts a.inspect
  a << 3
  puts a.inspect
  x = 0
  a.each { |e| x += e }
  puts a.inspect
  puts x

  puts a.map { |e| "Element #{e}" }
  puts a.inject(0) { |s,e| s + e }
  puts a.to_a.inspect
  puts a.select { |e| e > 3 }.inspect

  puts a.report("So many fish") { |e| "#{e} fish" }
end