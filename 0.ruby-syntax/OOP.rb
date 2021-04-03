require_relative "crud"
class Student
  include Crud
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


william = Student.new("a","b","c","d","password")
hash = william.create_hash(william.password)
p hash

