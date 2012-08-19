require "rspec"

class LockBox

  UnauthorizedAccess = Class.new(StandardError)
  InvalidPassword    = Class.new(StandardError)

  def initialize(options)
    @locked   = true
    @password = options[:password]
    @content  = options[:content]
  end

  def unlock(pass)
    @password == pass ? @locked = false : raise(InvalidPassword)
  end

  def content
    @locked ? raise(UnauthorizedAccess) : @content
  end
end

describe LockBox do

  before(:each) do
    @lock_box = LockBox.new(password: "secret",
                            content:  "My Secret Message")
  end

  it "raise an error when an invalid password is used" do
    expect { @lock_box.unlock("kitten") }.to raise_error(LockBox::InvalidPassword)
  end

  it "Not raise error when a valid password is used" do
    expect { @lock_box.unlock("secret") }.to_not raise_error
  end

  it "prevent access to content by default" do
    expect { @lock_box.content }.to raise_error(LockBox::UnauthorizedAccess)
  end

  it "allow access to content when box is properly unlocked" do
    expect do
      @lock_box.unlock("secret")
      @lock_box.content
    end.to_not raise_error

  end

end
