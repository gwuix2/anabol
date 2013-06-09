User.find_by_id(78).destroy if User.find_by_id(78)

User.seed do |s|
  s.id    = 78
  s.email = "kokszos@example.com"
  s.name  = "Kokszos"
end