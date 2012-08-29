class Questioner

  def ask(question)
    puts question
    response = gets.chomp
    case(response)
    when /^y(es)?$/i
      true
    when /^no?$/i
      false
    else
      puts "I don't understand."
      ask question
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  q = Questioner.new
  puts q.ask("Are you happy") ? "Good I'm Glad" : "That's Too Bad"
end