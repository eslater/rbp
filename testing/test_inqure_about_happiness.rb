class Questioner

  def inquire_about_happiness
    ask("Are you happy?") ? "Good I'm Glad" : "That's Too Bad"
  end

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

class HappinessTest < Test::Unit::TestCase

  def setup
    @questioner = Questioner.new
  end

  must "respond 'Good I'm Glad' when inquire_about_happiness gets 'yes'" do
    def @questioner.ask(question); true; end
    assert_equal "Good I'm Glad", @questioner.inquire_about_happiness
  end

  must "respond 'That's Too Bad' when inquire_about_happiness gets 'no'" do
    def @questioner.ask(question); false; end
    assert_equal "That's Too Bad", @questioner.inquire_about_happiness
  end
end


