#--------------------
# Inlucde Vs. Extend
#--------------------

module Foo
  def foo
    "Sup"
  end
end

#INLCUDE
class Bar
  include Foo
end

raise "this is wrong" unless Bar.new.foo == "Sup"

begin
  Bar.foo
  raise "this shouldnt run"
rescue NoMethodError; end

#EXTEND
class Baz
  extend Foo
end

raise "this is wrong" unless Baz.foo == "Sup"

begin
  Baz.new.foo
  raise "this shouldnt run"
rescue NoMethodError; end

#-----------------------
# Inheritance and Mixins
#-----------------------

class Example
  def foo
    puts "Example"
    super
  end
end

class SubExample < Example
  def foo
    puts "SubExample"
    super
  end
end

module BaseInclude
  def foo
    puts "BaseInclude"
  end
end

module SubInclude
  def foo
    puts "SubInclude"
    super
  end
end

module ExtendThis
  def foo
    puts "Extend"
    super
  end
end

Example.send(:include, BaseInclude)
SubExample.send(:include, SubInclude)

se = SubExample.new
se.extend ExtendThis

se.foo

#-------
# Hooks!
#-------

module MyModule
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def bar
      'class method'
    end
  end

  def foo
    'instance method'
  end
end

class MyClass
  include MyModule
end

mc = MyClass.new
raise "This is wrong" unless mc.foo == "instance method"
raise "This is wrong" unless MyClass.bar == "class method"

puts "\nDONE!"


