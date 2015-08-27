require('./lib/recipe')

class Ingredient < ActiveRecord::Base

  has_and_belongs_to_many :recipes
  validates :name, presence: true

  define_singleton_method(:find_recipe) do |ing_name|
    recipes = Recipe.all
    filtered_arr = []
    recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
        if ing_name.eql?(ingredient.name)
          filtered_arr << recipe
        end
      end
    end
    filtered_arr
  end

  # before_save(:to_array)
  #
  # private
  #   define_method(:to_array) do
  #     self.name = name.split(", ")
  #     self.measurement = measurement.split(", ")
  #   end

end
