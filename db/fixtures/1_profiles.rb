Profile.find_by_user_id(78).destroy if Profile.find_by_user_id(78)

Profile.seed do |s|
  s.id = 78
  s.user_id = 78
  s.user_name = "Kokszos"
  s.magassag = 174
  s.nem2 = "Nő"
  s.gym = "City Gym"
  s.varos = "Coal city"
  s.slug = "kokszos"
  s.description = "Csak a sport."
  s.date_of_birth = 1989
  s.real_name = "Kokszi Makszi"
  s.sport = "Testépítés"
end