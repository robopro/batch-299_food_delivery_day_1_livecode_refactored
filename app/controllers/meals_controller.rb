require_relative 'base_controller'
require_relative '../views/meals_view'

class MealsController < BaseController
  # We don't inherit the #add method.
  # There's too much difference between the two methods in CustomersController
  # and MealsController that it isn't worth it.
  def add
    # 1. Ask user for name
    name = @elements_view.ask_for("name")
    # 2. Ask user for price
    price = @elements_view.ask_for("price").to_i
    # 3. Create a meal with name and price
    meal = Meal.new(name: name, price: price)
    # 4- Send meal to meal_repository
    @element_repository.add(meal)
    # 5. List all meals so user can see the change
    list
  end
end
