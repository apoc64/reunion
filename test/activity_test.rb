require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def setup
    @a = Activity.new("Zip Line")
    @a.add_participant("Bill", 15)
    @a.add_participant("Mary", 25)
  end

  def test_it_exists
    assert_instance_of Activity, @a
  end

  def test_it_has_a_name
    assert_equal @a.name, "Zip Line"
  end

  def test_it_starts_with_no_participants
    new_activity = Activity.new("Spelunking")
    assert_equal new_activity.participants, {}
  end

  def test_it_can_add_participants
    expected = {"Bill" => 15, "Mary" => 25}
    assert_equal expected, @a.participants

  end

  def test_it_can_evaluate_total_cost
    assert_equal 40, @a.total_cost
  end

  def test_it_can_evaluate_how_much_participant_owed
    assert_equal -5, @a.amount_owed("Mary")
    assert_equal 5, @a.amount_owed("Bill")
  end

  # def test_it_can_evaluate_what_all_participants_owe
  #   expected = {"Bill" => 5, "Mary" => -5}
  #   actual = @a.all_participants_owe
  #   assert_equal expected, actual
  # end

end
