require 'ruport'
if __FILE__ == $PROGRAM_NAME
  # apparently ruport isn't compatible with the standard CSV library (which is FasterCSV)

  table1 = Table(%w[first_name last_name],
  :data => [["Gregory","Brown"],["Deborah","Orlando"]])
  table2 = Table("people.csv")
  csv = "first_name,last_name\nGregory,Brown\nDeborah,Orlando\n"
  table3 = Table(:string => csv)

end