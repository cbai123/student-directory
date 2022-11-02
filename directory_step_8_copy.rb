def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # loop while name isn't empty
  while !name.empty? do
    # push student hash to student array
    students << { name: name, cohort: :november}
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
  i = 0
  while i < names.length
    puts "#{i + 1}. #{names[i][:name]} cohort: #{names[i][:cohort]}"
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)