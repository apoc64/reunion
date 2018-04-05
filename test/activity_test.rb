require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def setup
    @a = Activity.new
  end

  def test_it_exists
    assert_instance_of Activity, @a
  end

end
