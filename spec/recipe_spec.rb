require('spec_helper')

describe(Recipe) do

  it('changes the rating into an integer') do
    new_recipe = Recipe.create({name: 'chicken stir fry suprise', rating: '3'})
    expect(new_recipe.rating).to(eq(3))
  end

  describe('#dishes') do
    it('returns a recipe') do
      new_recipe = Recipe.create({name: 'chicken stir fry suprise'})
      new_dish = new_recipe.dishes.create({name: 'stir fry'})
      expect(new_recipe.dishes).to(eq([new_dish]))
    end

  end

end
