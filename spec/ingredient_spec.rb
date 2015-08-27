require('spec_helper')

describe(Ingredient) do
  it('returns all of the recipes that contain a specific ingredient') do
    new_recipe = Recipe.create({name: 'chicken stir fry suprise'})
    new_ingredient = new_recipe.ingredients.create({ name: 'carrot' })
    new_ingredient1 = new_recipe.ingredients.create({ name: 'onion' })
    new_ingredient2 = new_recipe.ingredients.create({ name: 'chicken' })

    new_recipe2 = Recipe.create({name: 'chicken stir fry'})
    new_ingredient3 = new_recipe2.ingredients.create({ name: 'carrot' })
    new_ingredient4 = new_recipe2.ingredients.create({ name: 'onion' })
    new_ingredient5 = new_recipe2.ingredients.create({ name: 'beef' })

    expect(Ingredient.find_recipe('carrot')).to(eq([new_recipe, new_recipe2]))
  end

  it("converts the name to lowercase") do
    ingredient = Ingredient.create({:name => "Carrots"})
    expect(ingredient.name()).to(eq("carrots"))
  end

end
