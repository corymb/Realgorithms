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

react_loader = "if (typeof(Opal) !== 'undefined') {" \
    'Opal.mark_as_loaded("opal");' \
    'Opal.mark_as_loaded("corelib/runtime.self");' \
    'Opal.mark_as_loaded("jquery.self");' \
    'Opal.mark_as_loaded("sources/react.self");' \
    'Opal.load("reacting");' \
"}"

Cuba.define do
  @g = {
    'react_loader' => react_loader
  }
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
