require_relative "app/models/meal"
require_relative "app/repositories/meal_repository"

require_relative "app/models/customer"
require_relative "app/repositories/customer_repository"

# repo = MealRepository.new('data/meals.csv')
# p repo

# meal = Meal.new(name: "pizza", spaceship: "Apollo")
# p meal


customer_repo = CustomerRepository.new('data/customers.csv')
p customer_repo
