require('spec_helper')

describe(Recipe) do

  describe('#dishes') do
    it('returns a recipe') do
      new_recipe = Recipe.create({name: 'chicken stir fry suprise'})
      new_dish = new_recipe.dishes.create({name: 'stir fry'})
      expect(new_recipe.dishes).to(eq([new_dish]))
    end
  end

end
