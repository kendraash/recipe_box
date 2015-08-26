class Ingredient < ActiveRecord::Base

  belongs_to :recipe
  validates :name, presence: true,
  before_save(:to_array)

  private
    define_method(:to_array) do
      self.name = name.split(", ")
      self.measurement = measurement.split(", ")
    end

end
