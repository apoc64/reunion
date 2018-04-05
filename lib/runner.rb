require './lib/reunion'
require './lib/activity'
require 'erb'
require 'pry'

reunion = Reunion.new("Hawaii")
snorkel = Activity.new("Snorkeling")
beach = Activity.new("Beach")
volcano = Activity.new("Volcano")

reunion.add_activity(snorkel)
reunion.add_activity(beach)
reunion.add_activity(volcano)

snorkel.add_participant("Yoyo", 100)
snorkel.add_participant("Bobo", 50)
snorkel.add_participant("Dodo", 10)

beach.add_participant("Yoyo", 20)
beach.add_participant("Bobo", 15)

volcano.add_participant("Yoyo", 30)
volcano.add_participant("Dodo", 17)

info = reunion.generate_report
puts info

erb = ERB.new("<h1>Reunion</h1><p><%=info%></p>")
binding.pry
