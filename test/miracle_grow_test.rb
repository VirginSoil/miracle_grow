require './test/test_helper'

class MiracleGrowTest < Minitest::Test
  def test_the_plants_can_be_gitted
    assert MiracleGrow::Plant.get_the_plants
  end
end