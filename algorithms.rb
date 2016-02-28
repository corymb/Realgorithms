module Helpers
  def get_algorithm(type)
    algorithms = {
      :mergesort => 'Test mergesort code',
      :quicksort => 'Test quicksort code'
    }
    if not algorithms[type]
      raise404()
    end
    algorithms[type]
  end
end
