Profile.find_by_user_id(78).workouts.destroy

Workout.seed do |s|
  s.profile_id = 78
  s.name = "Edzésem"
  s.color = "kék"
  s.slug = "edzesem"
  s.description = "Edzettem g"
  s.period_time = "40"
  s.mikor = Time.now
end

Workout.seed do |s|
  s.profile_id = 78
  s.name = "Edzésem2"
  s.color = "piros"
  s.slug = "edzesem2"
  s.description = "Edzettem great"
  s.period_time = "50"
  s.mikor = Time.now - 1.day
end