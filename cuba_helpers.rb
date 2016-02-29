module CubaHelpers

  def to_json(data)
    """Returns data as a JSON response """
      res.headers["Content-Type"] = "application/json; charset=utf-8"
      res.write data.to_json
  end

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
