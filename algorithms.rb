module Helpers
  def read_file(filename)
    File.read(filename)
  end

  def get_algorithm(type)
    algorithms = {
      :mergesort => 'Test mergesort code',
      :quicksort => 'Test quicksort code',
      :insertionsort => 'insertion_sort.py'
    }
    if not algorithms[type]
      raise404()
    end
    read_file algorithms[type]
  end
end
