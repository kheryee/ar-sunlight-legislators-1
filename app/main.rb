require_relative '../db/config'
require_relative 'models/legislator'
require_relative 'models/representative'
require_relative 'models/senator'

#-----------------------

def senators
  puts "Senators: "
  Legislator.where('title = ?', 'Sen').where('state = ?', @input).each do |x|
    puts "#{x.full_name} (#{x.party})"
  end
puts "\n"
end
# senators


def representatives

  puts "Representative: "
  Legislator.where('title = ?', 'Rep').where('state = ?', @input).each do |x|
    puts "#{x.full_name} (#{x.party})"
  end
end
# representatives

def prompt_for_state
  print "Enter a state: "
  @input = gets.chomp.upcase
  senators
  representatives
end
#prompt_for_state

#-----------------------


def male_percentage
  a = []
  Legislator.where('title = ? AND gender = ?', 'Sen', 'M' ).where('in_office = ?', '1').each do |x|
    a << x
  end
  puts "Male Senators: #{a.count} (#{((a.count * 100).to_f / Senator.active_in_office.count).round(2)}%)"
  a = []
  Legislator.where('title = ? AND gender = ?', 'Rep', 'M' ).where('in_office = ?', '1').each do |x|
    a << x
  end
  puts "Male Representatives: #{a.count} (#{((a.count * 100).to_f / Representative.active_in_office.count).round(2)}%)"
end
#male_percentage

def female_percentage
  a = []
  Legislator.where('title = ? AND gender = ?', 'Sen', 'F' ).where('in_office = ?', '1').each do |x|
    a << x
  end
  puts "Female Senators: #{a.count} (#{((a.count * 100).to_f / Senator.active_in_office.count).round(2)}%)"
  a = []
  Legislator.where('title = ? AND gender = ?', 'Rep', 'F' ).where('in_office = ?', '1').each do |x|
    a << x
  end
  puts "Female Senators: #{a.count} (#{((a.count * 100).to_f / Representative.active_in_office.count).round(2)}%)"
end

def prompt
  puts "Male or female?"
  input = gets.chomp.downcase
  if input == 'male' or input == 'm'
    male_percentage
  elsif input == 'female' or input =='f'
    female_percentage
  else
    puts "Wrong input. Try again."
    prompt
  end
end

# prompt


#---------------------------

def state
  senator = Legislator.select(:state).where("title = 'Sen'").where("in_office = '1'").group(:state).count
  rep = Legislator.select(:state).where("title = 'Rep'").where("in_office = '1'").group(:state).count
  rep = rep.sort_by {|key,value| value}.reverse!
  rep.each do |key, value|
  p "#{key}: " "#{senator[key]} Senators, #{value} Representative(s)"
end

end
state




#---------------------------


def percentage
  a = []
  Legislator.where('title = ? AND gender = ?', 'Sen', 'M' ).each do |x|
    a << x
  end
  puts "Senators: #{Senator.show.count}"

  a = []
  Legislator.where('title = ? AND gender = ?', 'Rep', 'M' ).each do |x|
    a << x
  end
  puts "Representatives: #{Representative.show.count}"
end
# percentage
