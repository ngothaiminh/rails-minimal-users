
# optional: seed a few users
3.times do |i|
  User.find_or_create_by!(email: "seed#{i+1}@example.com") do |u|
    u.name = "Seed User #{i+1}"
  end
end
