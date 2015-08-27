require("bundler/setup")
Bundler.require(:default)
require('./lib/dish')
require('./lib/recipe')
require('./lib/ingredient')
require('pry')

get('/') do
  @dishes = Dish.all
  @ingredients = Ingredient.all
  # binding.pry
  erb(:index)
end

post('/dishes') do
  name = params['dish_name']
  Dish.create({name: name})
  redirect('/')
end

get('/dishes/new') do
  erb(:dish_form)
end

get('/dishes/:id') do
  @dish = Dish.find(params['id'].to_i)
  @recipes = @dish.recipes


  erb(:dish)
end

get('/dishes/:id/recipes/new') do
  @dish = Dish.find(params['id'].to_i)
  erb(:recipe_form)
end

post('/dishes/:id/new/recipes') do
  dish = Dish.find(params.fetch("id").to_i)

  recipe_name = params['recipe_name']
  recipe_category = params['recipe_category']
  recipe_rating = params['recipe_rating']

  recipe_ingredients = params['recipe_ingredients']
  recipe_measurements = params['recipe_measurements']

  recipe = Recipe.create({name: recipe_name, category: recipe_category, rating: recipe_rating})
  dish.recipes.push(recipe)

  ingredient_arr = []
  counter = 0
  recipe_ingredients.each do |ingredient|
    ingredient_obj = Ingredient.create({ name: ingredient, measurement: recipe_measurements[counter], recipe_id: recipe.id})
    counter += 1
  end

  redirect("/dishes/#{dish.id}")
end

get('/recipes/:id') do
  recipe_id = params['id']
  @recipe = Recipe.find(recipe_id.to_i)
  @ingredients = @recipe.ingredients
  erb :recipe
end

get('/recipe/:id/edit') do
  @recipe = Recipe.find(params['id'].to_i)
  erb(:recipe_edit_form)
end

patch('/recipes/:id') do
  @recipe = Recipe.find(params['id'].to_i)
  recipe_name = params['recipe_name']
  recipe_category = params['recipe_category']
  recipe_rating = params['recipe_rating']

  recipe_ingredients = params['recipe_ingredients']
  recipe_measurements = params['recipe_measurements']

  @recipe.update({name: recipe_name, category: recipe_category, rating: recipe_rating})

  ingredient_arr = []
  counter = 0
  ingredients_remove = @recipe.ingredients
  ingredients_remove.each do |ingred|
    ingred.destroy
  end
  recipe_ingredients.each do |ingredient|
    ingredient_obj = Ingredient.create({ name: ingredient, measurement: recipe_measurements[counter], recipe_id: @recipe.id})
    counter += 1
  end
  redirect("/recipes/#{@recipe.id}")
end

get('/recipes/:id/delete') do
  @recipe = Recipe.find(params['id'].to_i)
  @dish = Dish.find(@recipe.dishes.first.id)
  @dish.recipes.destroy(@recipe)
  redirect("/dishes/#{@dish.id}")
end

get('/ingredients/:id') do
  @ingredient = Ingredient.find(params['id'].to_i)
  @recipes = @ingredient.recipes
  binding.pry

  erb(:recipes_with_ingredient)
end
