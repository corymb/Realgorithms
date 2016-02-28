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
  def get_attr(attr)
    globals = self.instance_variable_get("@g")
    globals[attr]
  end

  # Get requests:
  on get do
    on root do
      res.write view("home")
    end

    on 'algorithm/:type' do | type |
      algorithm = get_algorithm(type.to_sym)
      algorithm_code = { code: algorithm }
      res.headers["Content-Type"] = "application/json; charset=utf-8"
      res.write algorithm_code.to_json
    end
  end
end
