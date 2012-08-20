class Questioner

  def ask(question)
    puts question
    response = yes_or_no(gets.chomp)
    response.nil? ? ask(question) : response
  end

  def yes_or_no(response)
    case(response)
    when /^y(es)?$/i
      true
    when /^no?$/i
      false
    end
  end

end

require "test/unit"
require_relative "test_unit_extensions"

class QuestionerTest < Test::Unit::TestCase

  def setup
    @questioner = Questioner.new
  end

  %w[y Y YeS YES yes].each do |yes|
    must "return true when yes_or_no parses #{yes}" do
      assert @questioner.yes_or_no(yes), "#{yes.inspect} expected to parse as true"
    end
  end

  %w[n N no nO].each do |no|
    must "return false when yes_or_no parses #{no}" do
      assert ! @questioner.yes_or_no(no), "#{no.inspect} expected to parse as false"
    end
  end

  %w[Note yesterday xyzaty].each do |mu|
    must "return nil because #{mu} is not a variant of 'yes' or 'no'" do
      assert @questioner.yes_or_no(mu), "#{mu.inspect} expected to parse as nil"
    end
  end

end


