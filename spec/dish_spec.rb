require('spec_helper')

describe(Dish) do

  describe('#recipes') do
    it('returns a recipe') do
      new_dish = Dish.create({name: 'stir fry'})
      recipe = new_dish.recipes.create({name: 'chicken stir fry suprise'})
      expect(new_dish.recipes).to(eq([recipe]))
    end
  end

end
