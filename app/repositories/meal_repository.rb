require_relative 'base_repository'

class MealRepository < BaseRepository
  private

  # This method takes the row we read from the meals.csv
  # Transforms the row[:price] to an integer.
  # And returns a new Meal instance, which we built with the information in row.
  def build_element(row)
    row[:price] = row[:price].to_i
    Meal.new(row)
  end
end
