#!/usr/bin/env ruby

require 'csv'
require 'people'

np = People::NameParser.new(:case_mode => 'upper')
CSV.foreach('contributors.txt', :col_sep => '|', :quote_char => "\x00") do |row|
  no_title = row[7].gsub(/ (MR.|MRS.|DR.|MS.)$/, '')                                
  name = np.parse(no_title)
  next if name[:last].empty?
  date_parts = row[13].match(/(\d\d)(\d\d)(\d\d\d\d)/)
  date_string = "#{date_parts[3]}-#{date_parts[1]}-#{date_parts[2]}"
  puts [name[:last], name[:first], name[:middle], row[8], row[9], row[10], row[11], row[12], date_string, row[14], row[0]].to_csv(:col_sep => '|', :quote_char => "\x00")
end
