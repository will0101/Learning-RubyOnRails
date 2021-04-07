class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  validates :username, :email, presence: true, uniqueness: {case_sensitive:false} 
  validates :username,  length: {minimum:3, maximum: 25}
  validates :email, format: {with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  has_many :articles, dependent: :destroy
  has_secure_password 
end 