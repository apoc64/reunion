require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def setup
    @r = Reunion.new("Chicago")
  end

  def test_it_exists
    assert_instance_of Reunion, @r
  end

  def test_it_has_a_location
    assert_equal "Chicago", @r.location
  end

  def test_it_starts_with_no_activities
    assert_equal [], @r.activities
  end

  def test_it_can_add_activities
    zip = Activity.new("Zip Line")
    cave = Activity.new("Spelunking")
    @r.add_activity(zip)
    @r.add_activity(cave)
    expected = [zip, cave]
    assert_equal expected, @r.activities
  end

end
