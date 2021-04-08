class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 6, maximum: 100}
  validates :description, presence: true, length: {minimu: 10, maximum: 140}
  belongs_to :user 
  has_many :article_categories 
  has_many :categories, through: :article_categories 
end 