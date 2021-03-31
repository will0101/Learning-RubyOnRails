first_name = "William"
last_name = "Bogans"
p first_name + " " + last_name

full_name = "#{first_name} #{last_name}"
# String interpolation only works with double quotes in Ruby
p "Hello #{full_name}"

# Everything is an object
p full_name.class 
p 10.class

# p full_name.methods


# Method chaining 
p 10.to_s.class

p "Looooong string".length

p "".empty?
p "".nil?
p nil.nil?


sentence = "welcome to the jungle"
p sentence.sub("the jungle", "utopia")



puts "What is your first name?"
first_name = gets.chomp 
puts "Thank you #{first_name}"