#!/usr/bin/env ruby

require 'csv'

committee_ids = []
CSV.foreach('candidates.txt', :headers => true, :col_sep => '|', :quote_char => "\x00") do |row|
 committee_ids << row[0]
end

skips = ['C00577981', 'C00578757', 'C00577312', 'C00575449', 'C00578658']
used = committee_ids - skips

included = {}
used.each {|id| included[id] = 0}

CSV.foreach('itcont.txt', :col_sep => '|', :quote_char => "\x00") do |row|
    #skip if not a contrib                      
    next if row[5] != '15'
    committee_id = row[0]
    if used.include? committee_id 
      if included[committee_id] < 25
        puts row.to_csv(:col_sep => '|')
        included[committee_id] += 1
      else
        used.delete committee_id
        break if used.length == 0
      end
    end
end


exit
#####
## Check the number of contributors per candidate
#####
committee_counts = {}
committee_ids.each do |id|
  committee_counts[id] = 0
end


committee_ids.each do |id|
  CSV.foreach('contributors.txt', :col_sep => '|', :quote_char => "\x00") do |row|
    committee_counts[id] += 1 if row[0] == id
  end
end

puts committee_counts
