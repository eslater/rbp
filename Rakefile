require "rake/testtask"

task :default => [:test]

Rake::TestTask.new do |test|
  test.libs << "test"
  test.test_files = Dir["testing/test/test_*.rb"]
  test.verbose    = true
end

Rake::TestTask.new(:alternate) do |test|
  test.libs << "test"
  test.test_files = Dir["testing/test/test_*.rb"]
  test.verbose    = true
end

# shamelessly stolen from: http://jasonseifer.com/2010/04/06/rake-tutorial
desc "turn off alarm"
task :turn_off_alarm do
  puts "Turned off alarm. Would have liked 5 more minutes, though."
end

desc "groom"
task :groom_myself do
  puts "Brushed teeth."
  puts "Showered."
  puts "Shaved."
end

desc "make coffee"
task :make_coffee do
  cups = ENV["COFFEE_CUPS"] || 2
  puts "Made #{cups} cups of coffee. Shakes are gone."
end

desc "walk the dog"
task :walk_dog do
  puts "Dog walked."
end

desc "get ready"
task :ready_for_the_day => [:turn_off_alarm, :groom_myself, :make_coffee, :walk_dog] do
  puts "Ready for the day!"
end