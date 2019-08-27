require_relative 'base_controller'
require_relative '../views/customers_view'

class CustomersController < BaseController
  # We don't inherit the #add method.
  # There's too much difference between the two methods in CustomersController
  # and MealsController that it isn't worth it.
  def add
    # 1. Ask user for name
    name = @elements_view.ask_for("name")
    # 2. Ask user for price
    address = @elements_view.ask_for("address")
    # 3. Create a element with name and address
    customer = Customer.new(name: name, address: address)
    # 4- Send customer to customer_repository
    @element_repository.add(customer)
    # 5. List all meals so user can see the change
    list
  end
end
