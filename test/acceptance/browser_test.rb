require_relative '../test_helper.rb'

class AcceptanceTest
  def test_home
    visit "/"

    assert_content "Insertion Sort"
  end
end
