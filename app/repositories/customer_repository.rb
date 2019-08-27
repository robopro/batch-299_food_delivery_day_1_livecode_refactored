require_relative 'base_repository'

class CustomerRepository < BaseRepository
  private

  # This method takes the row we read from the customers.csv
  # There's nothing to transform in the row hash.
  # So we just return a new Customer instance, which we built with the information in row.
  def build_element(row)
    Customer.new(row)
  end
end
