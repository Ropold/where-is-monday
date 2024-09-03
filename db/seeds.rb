# Lösche alle bestehenden Datensätze
Sighting.destroy_all
User.destroy_all
Cat.destroy_all

puts "Creating Users:"
user1 = User.create(email: "john@wayne.com", password: "1234567898")
user2 = User.create(email: "john@wick.com", password: "1234567898")

puts "Creating Cats:"

cat1 = Cat.create(
  name: "Whiskers",
  description: "A friendly cat",
  race: "Siamese",
  eye_color: "Blue",
  color: "Cream",
  fur: "Short",
  found: false,
  user_id: user1.id,
  origin_address: "Kölner Dom, Köln, Deutschland",
  origin_longitude: 6.9583,
  origin_latitude: 50.9413
)

cat2 = Cat.create(
  name: "Mittens",
  description: "Loves to play with yarn",
  race: "Tabby",
  eye_color: "Green",
  color: "Gray",
  fur: "Medium",
  found: true,
  user_id: user1.id,
  origin_address: "Rheinpark, Köln, Deutschland",
  origin_longitude: 6.9747,
  origin_latitude: 50.9484
)

cat3 = Cat.create(
  name: "Shadow",
  description: "Very stealthy",
  race: "Black Cat",
  eye_color: "Yellow",
  color: "Black",
  fur: "Short",
  found: false,
  user_id: user1.id,
  origin_address: "Schokoladenmuseum, Köln, Deutschland",
  origin_longitude: 6.9658,
  origin_latitude: 50.9375
)

cat4 = Cat.create(
  name: "Snowball",
  description: "Loves the snow",
  race: "Persian",
  eye_color: "Blue",
  color: "White",
  fur: "Long",
  found: true,
  user_id: user1.id,
  origin_address: "Zoo Köln, Köln, Deutschland",
  origin_longitude: 6.9744,
  origin_latitude: 50.9574
)

cat5 = Cat.create(
  name: "Tiger",
  description: "Has a fierce look",
  race: "Bengal",
  eye_color: "Amber",
  color: "Orange",
  fur: "Short",
  found: false,
  user_id: user1.id,
  origin_address: "Flora und Botanischer Garten Köln, Köln, Deutschland",
  origin_longitude: 6.9737,
  origin_latitude: 50.9606
)

puts "Creating Sightings in Cologne:"

5.times do |i|
  Sighting.create!(
    longitude: 6.96 + rand(-0.01..0.01),  # Zufällige Längengrad-Koordinaten nahe Köln
    latitude: 50.94 + rand(-0.01..0.01),  # Zufällige Breitengrad-Koordinaten nahe Köln
    last_seen_at: Time.current - rand(1..7).days,  # Sichtung innerhalb der letzten Woche
    description: "Katze gesichtet in Köln, Sichtung ##{i + 1}",
    address: "Köln, Deutschland",
    user_id: user1.id,  # Weist die Sichtung dem Benutzer John Wayne zu
    cat_id: Cat.all.sample.id  # Weist die Sichtung einer zufälligen Katze aus Köln zu
  )
end
