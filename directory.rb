@students = []

def input_students
  months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  puts "Please enter the names of the students"
  puts "To finish, just hit return with the name field blank"

  # get the first name
  name = STDIN.gets.strip

  # loop while name isn't empty
  while !name.empty? do
    while true do
      puts "Which cohort?"; cohort = STDIN.gets.strip.downcase.to_sym
      if cohort.empty? || months.include?(cohort) then break end
    end
    cohort = :november if cohort.empty?

    # push student hash to student array
    @students << { name: name, cohort: cohort }
    @students.length == 1 ? (puts "now we have #{@students.count} student") : (puts "now we have #{@students.count} students")

    # get next name
    puts "Enter name:"
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp.to_i)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when 1
    input_students
  when 2
    if !@students.empty?
      show_students
    end
  when 3
    save_students
  when 4
    load_students
  when 9
    exit
  else
    puts "I don't know what you mean. Please try again."
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students_list
  names_sorted = {}
  @students.map { |name| 
    if names_sorted[name[:cohort]].nil? then names_sorted[name[:cohort]] = [] end
    names_sorted[name[:cohort]] << name[:name]
    }
  names_sorted.each{ |cohort,names| 
    i = 0
    puts "#{cohort}:\n".center(50)
    while i < names.length
      puts names[i].center(50)
      i += 1
    end
    puts "---".center(50)
  }
end

def print_footer
  if @students.length == 1
    puts "Overall, we have #{@students.count} great student".center(50)
  else
    puts "Overall, we have #{@students.count} great students".center(50)
  end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename,"r")
  file.readlines.each { |line| 
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  }
  file.close
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each { |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  file.close
end

try_load_students
interactive_menu