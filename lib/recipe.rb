class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :dishes
  has_and_belongs_to_many :ingredients
  before_save(:rating_to_int)


  private
    define_method(:rating_to_int) do
      self.rating=(rating().to_i())
    end
end
