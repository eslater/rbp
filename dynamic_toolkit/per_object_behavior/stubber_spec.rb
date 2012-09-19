require 'rspec'

class User
end

module Stubber
  extend self

  def stubs(method, options={})
    singleton(options[:for]).send(:define_method, method) do |*a|
      options[:returns]
    end
  end

  def singleton(obj)
    class << obj;
      self;
    end
  end
end

describe Stubber do
  let(:user) { User.new }
  it "should respond to logged_in?" do
    Stubber.stubs(:logged_in?, :for => user, :returns => true)
    user.should respond_to(:logged_in?)
  end

  it "should respond to logged_in?" do
    User.new.should_not respond_to(:logged_in?)
  end
end