require 'CSV'
@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return with the name field blank"
  # get the first name
  name = STDIN.gets.strip
  # loop while name isn't empty
  while !name.empty? do
    # push student hash to student array
    add_student(name,:november)
    puts "now we have #{@students.count} students"
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
  puts "3. Save the list"
  puts "4. Load the list"
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
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer
    puts "Overall, we have #{@students.count} great students".center(50)
end

def add_student(name,cohort)
  @students << {name: name, cohort: cohort}
end

def try_load_students
  filename = ARGV.first
  if filename.nil? then filename = "students.csv" end
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  end
end

def load_students(filename = "students.csv")
  puts "Enter filename to load from. Leave blank for default"
  filename = STDIN.gets.chomp
  if filename.empty? then filename = "students.csv" end
  puts "loading students from #{filename}"
  CSV.foreach(filename) {|line|
      name, cohort = line
      add_student(name,cohort)
  }
end

def save_students
  puts "Enter filename to save to. Leave blank for default"
  filename = STDIN.gets.chomp
  if filename.empty? then filename = "students.csv" end
  puts "saving students to #{filename}"
    # open the file for writing
    CSV.open(filename, "wb") { |line|
    # iterate over the array of students
    @students.each { |student|
      student_data = [student[:name], student[:cohort]]
      #csv_line = student_data.join(",")
      line.puts student_data
    }
  }
end

try_load_students
interactive_menu