class Category <  ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {minimum: 5, maximum:20}
  has_many :article_categories
  has_many :articles, through: :article_categories
end 