class Reunion
  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.map do |activity|
      activity.total_cost
    end.sum
  end

  def participants_owe
    total_owed = Hash.new(0)
    @activities.each do |activity|
      activity.participants.keys.each do |participant|
        total_owed[participant] += activity.amount_owed(participant)
      end
    end
    total_owed
  end

  

end
