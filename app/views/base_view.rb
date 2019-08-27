class BaseView
  # So far in the view we can inherit both the #display and #ask_for methods.
  def display(element)
    print `clear`
    element.each do |element|
      # Because we're inheriting this method, and because meal objects and
      # customer objects need to display differet information (price vs. address)
      # we wrote custom #to_s methods for them, which return the string we want.
      puts element.to_s
    end
    puts ""
  end

  def ask_for(attribute)
    puts "What is the #{attribute}?"
    gets.chomp
  end
end
