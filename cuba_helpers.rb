module CubaHelpers
  def raise404()
      res.status = 404
      res.write view("404")
      halt(res.finish)
  end
end
