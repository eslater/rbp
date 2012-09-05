if __FILE__ == $PROGRAM_NAME
  "This is a string".instance_eval do
    puts "O hai, can has reverse? #{reverse}. kthxbye"
  end
end