def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # loop while name isn't empty
  while !name.empty? do
    puts "Enter a hobby, country of birth, height. Or leave blank"
    puts "Hobby: "; hobby = gets.strip
    puts "Country of birth: "; birth = gets.strip
    puts "Height: "; height = gets.strip
    # push student hash to student array
    students << { name: name, cohort: :november, hobby: hobby, birth: birth, height: height}
    puts "now we have #{students.count} students"
    # get next name
    name = gets.chomp
  end
  #return students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  puts "Would you like to search for students whose name: begins with a specific letter (1), is less than 12 characters (2), or print all names (3)?"
  answer = gets.chomp.to_i
  if answer == 1
    puts "Enter a letter"
    letter = gets.chomp
    names.each_with_index { |name,index| if name[:name][0] == letter then puts "#{index + 1}. #{name[:name]} (#{name[:cohort]} cohort)" end }
  elsif answer = 2
    names.each_with_index { |name,index| if name[:name].length  < 12 then puts "#{index + 1}. #{name[:name]} (#{name[:cohort]} cohort)" end }
  else
    names.each_with_index { |name,index| puts "#{index + 1}. #{name[:name]} (#{name[:cohort]} cohort)" }
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)