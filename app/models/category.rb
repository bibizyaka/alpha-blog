class Category < ActiveRecord::Base
  
  validates :name, presence: true
  #validates :name, uniqueness: true
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 25
  validates_length_of :name, :minimum => 3
  
end