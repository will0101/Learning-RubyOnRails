users = [
  {username:"a",password:"b"},
  {username:"c", password:'d'}
]

def auth_user(username, password, list_of_users)
  list_of_users.each do |user|
    if user[:username] ==username && user[:password] == password 
     return user[:username] 
   end
  end 
  "Crendentials were not correct"
end 



tries = 3
while tries < 4
  print "Username: "
  username = gets.chomp 
  print "Password: "
  password = gets.chomp
  credentials = auth_user(username,password,users)
  p credentials
  puts "Press n to quit. Press anything else to continue"
  input = gets.chomp.downcase 
  break if input == "n"
  tries += 1
end