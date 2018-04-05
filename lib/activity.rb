class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = Hash.new
  end

  def add_participant(name, amount_paid)
    @participants[name] = amount_paid
  end

  def total_cost
    @participants.values.sum
  end

  def amount_owed(name)
    count = @participants.count
    cost_per_participant = total_cost/count
    cost_per_participant - @participants[name]
  end

end
