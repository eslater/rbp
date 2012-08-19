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
  it "compute volume based on length, width, and height" do
    # defaults to l=w=h=1
    volume.should == 1
    
    #when given 1 arg, set l=x, set w,h = 1
    x = 6
    volume(x).should == x

    # when given 2 args, set l=x, w=y and h=1
    y = 2
    volume(x,y).should == x*y

    # when given 3 args, set l=x, w=y and h=z
    z = 7
    volume(x,y,z).should == x*y*z

    # when given a hash, use :length, :width, :height
    volume(length: x, width: y, height: z).should == x*y*z

  end
end
