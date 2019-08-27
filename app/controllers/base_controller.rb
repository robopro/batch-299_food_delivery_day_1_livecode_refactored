class BaseController
  def initialize(element_repository, elements_view)
    @element_repository = element_repository
    @elements_view = elements_view
  end

  def list
    # 1. Gets the elements from the element_repository
    elements = @element_repository.all
    # 2. Passes the elements to the view display method
    @elements_view.display(elements)
  end
end
