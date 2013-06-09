Profile.find(78).sizes.destroy

Size.seed do |s|
  s.nyak = 1
  s.mell = 2
  s.vall = 3
  s.kar = 4
  s.alkar = 5
  s.derek = 6
  s.csipo = 7
  s.comb = 8
  s.vadli = 9
  s.testsuly = 10
  s.testzsir = 11
  s.profile_id = 78
  s.mikor = Time.now
end

Size.seed do |s|
  s.nyak = 14
  s.mell = 17
  s.vall = 19
  s.kar = 21
  s.alkar = 24
  s.derek = 27
  s.csipo = 29
  s.comb = 41
  s.vadli = 32
  s.testsuly = 137
  s.testzsir = 9
  s.profile_id = 78
  s.mikor = Time.now - 1.day
end

Size.seed do |s|
  s.nyak = 21
  s.mell = 21
  s.vall = 21
  s.kar = 21
  s.alkar = 21
  s.derek = 21
  s.csipo = 21
  s.comb = 21
  s.vadli = 21
  s.testsuly = 21
  s.testzsir = 21
  s.profile_id = 78
  s.mikor = Time.now - 2.day
end