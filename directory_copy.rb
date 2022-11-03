def input_students
  months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # loop while name isn't empty
  while !name.empty? do
    while true do
      puts "Which cohort?"; cohort = gets.strip.downcase.to_sym
      if cohort.empty? || months.include?(cohort) then break end
    end
    cohort = :november if cohort.empty?

    puts "Enter a hobby, country of birth, height. Or leave blank"
    puts "Hobby: "; hobby = gets.strip
    puts "Country of birth: "; birth = gets.strip
    puts "Height: "; height = gets.strip
    # push student hash to student array
    students << { name: name, cohort: cohort, hobby: hobby, birth: birth, height: height}
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
  puts "Would you like to search for students whose name: begins with a specific letter (1), is less than 12 characters (2), is sorted by cohort (3), or print all names (4)?"
  answer = gets.chomp.to_i
  if answer == 1
    puts "Enter a letter"
    letter = gets.chomp
    names.each_with_index { |name,index| if name[:name][0] == letter then puts "#{index + 1}. #{name[:name]} (#{name[:cohort]} cohort)" end }
  elsif answer == 2
    names.each_with_index { |name,index| if name[:name].length  < 12 then puts "#{index + 1}. #{name[:name]} (#{name[:cohort]} cohort)" end }
  elsif answer == 3
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