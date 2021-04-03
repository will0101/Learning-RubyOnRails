addresss = [1,2,3,4,5,6,7,8,9]

reversed_address = addresss.reverse!
p reversed_address

puts "Hello World!"


def say_hello(thing_to_say)
  puts thing_to_say
end


say_hello "William Bogans"


first_name = "William"
last_name = "Bogans"

puts "#{first_name} #{last_name} is my name"



puts first_name.class
# puts first_name.methods
puts 10.to_s.class


puts first_name.capitalize


# puts "What is your first name?"
# first_name = gets.chomp
# puts "Thank you #{first_name}"


# puts "Enter a number to multiply by 2"
# input = gets.chomp 
# puts "The answer is #{input.to_i * 2}"



puts 1 + 2
x = 5
y = 10
puts y / x



20.times {print "-"}
puts "\n"

puts rand(100)


number_5 = 5.to_f
puts number_5


puts 5 < 2


def multiply(first_num,second_num)
  first_num.to_f * second_num.to_f
end



puts multiply(9,2)


if true 
 puts "This is true"
end


if 5 < 2
 puts "This is not true"
else
 puts "Bye"
end

a = [1,2,3,4,5]
b = (1..5).to_a
p b.reverse

p b.length


food_quantity = {"pizza" => 10, "cake" => 6 }
p food_quantity
p food_quantity["pizza"]


food_quantity.each do |key, value|
  puts "We have #{value} #{key}s in stock"
end