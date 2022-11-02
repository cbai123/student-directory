def input_students
  months = [
    :january,
    :february,
    :march,
    :april,
    :may,
    :june,
    :july,
    :august,
    :september,
    :october,
    :november,
    :december
  ]
  puts "Please enter the names of the students"
  puts "To finish, just hit return with the name field blank"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # loop while name isn't empty
  while !name.empty? do
    while true do
      puts "Which cohort?"; cohort = gets.chomp.downcase.to_sym
      if cohort.empty? || months.include?(cohort) then break end
    end
    cohort = :november if cohort.empty?
    puts "Enter a hobby, country of birth, height. Or leave blank"
    puts "Hobby: "; hobby = gets.chomp
    puts "Country of birth: "; birth = gets.chomp
    puts "Height: "; height = gets.chomp
    # push student hash to student array
    students << { name: name, cohort: cohort, hobby: hobby, birth: birth, height: height }
    students.length == 1 ? (puts "now we have #{students.count} student") : (puts "now we have #{students.count} students")
    # get next name
    puts "Enter name:"
    name = gets.chomp
  end
  #return students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(names)
  names_sorted = {}
  names.map { |name| 
    if names_sorted[name[:cohort]].nil? then names_sorted[name[:cohort]] = [] end
    names_sorted[name[:cohort]] << name[:name]
    }
  names_sorted.each{ |cohort,names| 
    i = 0
    puts "#{cohort}:\n".center(50)
    while i < names.length
      puts names[0].center(50)
      i += 1
    end
    puts "---".center(50)
  }
end

def print_footer(names)
  if names.length == 1
    puts "Overall, we have #{names.count} great student".center(50)
  else
    puts "Overall, we have #{names.count} great students".center(50)
  end
end

students = input_students
print_header
print(students)
print_footer(students)