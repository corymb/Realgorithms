require "json"
require "cuba"
require "mote"
require "mote/render"
require "pry"

react_loader = "if (typeof(Opal) !== 'undefined') {" \
    'Opal.mark_as_loaded("opal");' \
    'Opal.mark_as_loaded("corelib/runtime.self");' \
    'Opal.mark_as_loaded("jquery.self");' \
    'Opal.mark_as_loaded("sources/react.self");' \
    'Opal.load("reacting");' \
"}"

def get_algorithm(type)
  algorithms = {
    :mergesort => 'Test mergesort code',
    :quicksort => 'Test quicksort code'
  }
  algorithms[type]
end

def raise404()
    res.status = 404
    res.write("Not found")
    halt(res.finish)
end

Cuba.plugin(Mote::Render)

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
      if not algorithm
        raise404()
      end
      algorithm_code = { code: algorithm }
      res.headers["Content-Type"] = "application/json; charset=utf-8"
      res.write algorithm_code.to_json
    end
  end
end
