class Category < ActiveRecord::Base
  
  has_many :article_categories
  has_many :articles, through: :article_categories
  
  validates :name, presence: true
  #validates :name, uniqueness: true
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 25
  validates_length_of :name, :minimum => 3
  
end