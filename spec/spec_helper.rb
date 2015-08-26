ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require("dish")
require("recipe")

RSpec.configure do |config|
  config.after(:each) do
    Dish.all().each() do |dish|
      dish.destroy()
    end
    Recipe.all().each() do |recipe|
      recipe.destroy()
    end
  end
end

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')
