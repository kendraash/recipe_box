class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :dishes
  has_many :ingredients
end
