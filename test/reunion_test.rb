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

  def test_it_can_evaluate_total_cost
    zip = Activity.new("Zip Line")
    cave = Activity.new("Spelunking")
    @r.add_activity(zip)
    @r.add_activity(cave)
    assert_equal 0, @r.total_cost

    zip.add_participant("Bill", 15)
    zip.add_participant("Mary", 25)
    assert_equal 40, @r.total_cost

    cave.add_participant("Bill", 10)
    cave.add_participant("Mary", 40)
    assert_equal 90, @r.total_cost
  end

  def test_it_can_evaluate_how_much_participants_owe
    zip = Activity.new("Zip Line")
    cave = Activity.new("Spelunking")
    @r.add_activity(zip)
    @r.add_activity(cave)
    zip.add_participant("Bill", 15)
    zip.add_participant("Mary", 25)
    cave.add_participant("Bill", 10)
    cave.add_participant("Mary", 40)

    actual = @r.participants_owe
    expected = {"Bill" => 20, "Mary" => -20}
    assert_equal expected, actual
  end

  def test_it_can_print_report
    zip = Activity.new("Zip Line")
    cave = Activity.new("Spelunking")
    @r.add_activity(zip)
    @r.add_activity(cave)
    zip.add_participant("Bill", 15)
    zip.add_participant("Mary", 25)
    cave.add_participant("Bill", 10)
    cave.add_participant("Mary", 40)
    expected = "Total amounts owed for reunion in Chicago:\n\n -Bill: 20\n -Mary: -20\n"
    actual = @r.generate_report
    assert_equal expected, actual
  end

end
