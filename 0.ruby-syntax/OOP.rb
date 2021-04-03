
class Student
  attr_accessor :first_name, :last_name, :email, :username, :password 


  def initialize(first_name,last_name,username,email,password)
    @first_name = first_name
    @last_name = last_name
    @username = username
    @email = email
    @password = password
  end

  def to_s 
  "First name: #{@first_name}"
  end 

end 

# william = Student.new("william","bogans","will0101","me@williambogans.dev","test12345")
# p william
# p william.first_name

