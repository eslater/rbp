require "rspec"


def volume(*args)
  if Hash === args.first
    x,y,z = [:length,:width,:height].map { |e| args.first[e] || 1 } 
  else
    x,y,z = 3.times.map { |i| args[i] || 1 }
  end
  x*y*z
end

describe "VolumeTest" do

  it "should return 1 by default if no arguments are given" do
    # defaults to l=w=h=1
    volume.should == 1
  end

  it "should set l=x, set w,h = 1 when given 1 numeric argument" do
    x = 6
    volume(x).should == x
  end

  it "should set l=x, w=y, and h=1 when given 2 arguments" do
    x, y = 6, 2
    volume(x,y).should == x*y
  end

  it "should set l=x, w=y, and h=z when given 3 arguments" do
    x,y,z = 6, 2, 7
    volume(x,y,z).should == x*y*z
  end

  it "should use :length, :width, and :height when given a hash argument" do
    x,y,z = 6, 2, 7
    volume(length: x, width: y, height: z).should == x*y*z
  end

end
