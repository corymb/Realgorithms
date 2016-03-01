require_relative 'test_helper.rb'

class MyTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    Cuba
  end

  def test_hello_world
    get '/'
    assert last_response.ok?
    # assert_equal "Hello, World!", last_response.body
  end
end