require 'csv'
require_relative '../models/meal'
require_relative '../models/customer'

# Our MealRepository and CustomerRepository (children) inherit from BaseRepository (parent)
# This means all methods and variables in the BaseRepository are available in both the
#  MealRepository and the CustomerRepository.
class BaseRepository
  def initialize(csv_path)
    @csv_path = csv_path
    # We use generic names for our variables in the base class.
    @elements = []
    @next_id = 1
    load_csv if File.exists?(@csv_path)
  end

  def all
    @elements
  end

  def add(element)
    # 1. Give id to element
    element.id = @next_id
    # 2. add element to elements array
    @elements << element
    # 3. save to csv
    save_csv
    # 4. Increment ID
    @next_id += 1
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      # Both Meal and Customer need to change the row[:id] to an integer before we build the respective instances.
      # So that we can do in our BaseRepository code.
      row[:id] = row[:id].to_i
      # We can't use Meal.new or Customer.new.
      # Because the load_csv is now the same for both the MealRepository and the CustomerRepository.
      # So we create a custom #build_row method in both of our repositories.
        # => See their respective files.
      @elements << build_element(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  def save_csv
    CSV.open(@csv_path, "wb") do |csv|
      # We grab the first element element in our elements array.
        # This returns either a meal or a customer
          # => Depending on if we're calling the save_csv from a MealRepository instance, or a CustomerRepository instance.
        # And we run #class on the returned element.
          # => #class metod returns the Class (so either Meal or Customer)
        # And then we call the #headers method on the class.
          # => See the Meal class file or the Customer class file for the #headers method
      csv << @elements.first.class.headers
      @elements.each do |element|
        # We also had to build a custom #to_csv method in our models.
        # See the Meal file or the Customer file for these methods.
        csv << element.to_csv
      end
    end
  end
end
