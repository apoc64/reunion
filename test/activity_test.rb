require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def setup
    @a = Activity.new("Zip Line")
  end

  def test_it_exists
    assert_instance_of Activity, @a
  end

  def test_it_has_a_name
    assert_equal @a.name, "Zip Line"
  end

  def test_it_starts_with_no_participants
    assert_equal @a.participants, []
  end

  def test_it_can_add_participants
    bill = {name: "Bill", paid: 15}
    mary = {name: "Mary", paid: 25}
    @a.add_participant(bill)
    @a.add_participant(mary)
    assert_equal @a.participants, [bill, mary]
  end

  def test_it_can_evaluate_total_cost
    bill = {name: "Bill", paid: 15}
    mary = {name: "Mary", paid: 25}
    @a.add_participant(bill)
    @a.add_participant(mary)
    assert_equal @a.total_cost, 40
  end

end
