module CubaHelpers

  def get_attr(attr)
    globals = self.instance_variable_get("@g")
    globals[attr]
  end

  def raise404()
      res.status = 404
      res.write view("404")
      halt(res.finish)
  end
end
