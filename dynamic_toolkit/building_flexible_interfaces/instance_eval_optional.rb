require 'prawn'

class MyBestFriend
  def initialize
    @first_name = "Paul"
    @last_name  = "Mouzas"
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def generate_pdf
    Prawn::Document.generate("friend.pdf") do
      text "My best friend is #{full_name}"
    end
  end
end

class MyOtherBestFriend
  def initialize
    @first_name = "Pete"
    @last_name  = "Johansen"
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def generate_pdf
    Prawn::Document.generate("friend.pdf") do |doc|
      doc.text "My best friend is #{full_name}"
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  # block.arity = 0 because there is no block variable given
  #MyBestFriend.new.generate_pdf

  # block.arity = 1 because there is a block variable given
  MyOtherBestFriend.new.generate_pdf

  puts Comparable.instance_method(:between?).arity
  puts Fixnum.instance_method(:to_f).arity
end