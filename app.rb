require "json"
require "cuba"
require "mote"
require "mote/render"
require "pry"

require_relative "cuba_helpers"
require_relative "react_helpers"
require_relative "algorithms"

Cuba.plugin(Mote::Render)
Cuba.plugin(CubaHelpers)
Cuba.plugin(ReactHelpers)
Cuba.plugin(Helpers)

Cuba.define do
  # Get requests:
  on get do
    on root do
      algorithm = get_algorithm(:insertionsort)
      algorithm_code = { code: algorithm }
      res.write view("home", {'insertion_sort' => algorithm_code})
    end

    on 'algorithm/:type' do | type |
      algorithm = get_algorithm(type.to_sym)
      algorithm_code = { code: algorithm }
      to_json algorithm_code
    end
  end
end
