require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/views/meals_view'

require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/views/customers_view'

require_relative 'router'

meal_repository = MealRepository.new("data/meals.csv")
meals_view = MealsView.new
meals_controller = MealsController.new(meal_repository, meals_view)


customer_repository = CustomerRepository.new("data/customers.csv")
customers_view = CustomersView.new
customers_controller = CustomersController.new(customer_repository, customers_view)

router = Router.new(meals_controller, customers_controller)
router.run
