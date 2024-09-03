# Lösche alle bestehenden Datensätze
Sighting.destroy_all
User.destroy_all
Cat.destroy_all
puts "Creating Users:"
user1 = User.create(email: "john@wayne.com", password: "1234567898")
user2 = User.create(email: "john@wick.com", password: "1234567898")
puts "Creating Cats:"
cat1 = Cat.create(
  name: "Luna",
  description: "A playful kitten who loves to chase shadows.",
  race: "British Shorthair",
  eye_color: "Green",
  color: "Gray",
  fur: "Short",
  found: false,
  user_id: user1.id,
  city: "Köln",
  origin_address: "Hohe Straße 30, Köln, Deutschland",
  origin_longitude: 6.9576,
  origin_latitude: 50.9376
)
cat2 = Cat.create(
  name: "Simba",
  description: "A courageous and adventurous cat.",
  race: "Maine Coon",
  eye_color: "Hazel",
  color: "Brown",
  fur: "Long",
  found: true,
  user_id: user2.id,
  city: "Köln",
  origin_address: "Neumarkt 1, Köln, Deutschland",
  origin_longitude: 6.9457,
  origin_latitude: 50.9372
)
cat3 = Cat.create(
  name: "Bella",
  description: "A gentle cat with a soft purr.",
  race: "Sphynx",
  eye_color: "Blue",
  color: "Pink",
  fur: "None",
  found: false,
  user_id: user1.id,
  city: "Köln",
  origin_address: "Friesenstraße 15, Köln, Deutschland",
  origin_longitude: 6.9448,
  origin_latitude: 50.9428
)
cat4 = Cat.create(
  name: "Leo",
  description: "An energetic cat who enjoys climbing trees.",
  race: "Abyssinian",
  eye_color: "Yellow",
  color: "Ruddy",
  fur: "Short",
  found: false,
  user_id: user2.id,
  city: "Köln",
  origin_address: "Rudolfplatz 5, Köln, Deutschland",
  origin_longitude: 6.9420,
  origin_latitude: 50.9378
)
cat5 = Cat.create(
  name: "Max",
  description: "A calm and friendly cat who loves the outdoors.",
  race: "Ragdoll",
  eye_color: "Blue",
  color: "White and Brown",
  fur: "Long",
  found: true,
  user_id: user1.id,
  city: "Leverkusen",
  origin_address: "Bahnhofstraße 8, Leverkusen, Deutschland",
  origin_longitude: 7.0086,
  origin_latitude: 51.0322
)
puts "Creating Sightings in 4x Cologne and 1x Leverkusen:"
Sighting.create(
  longitude: 6.9603,
  latitude: 50.9375,
  last_seen_at: DateTime.now - 2.days,
  description: "Spotted near the Cologne Cathedral, climbing a tree.",
  address: "Domkloster 4",
  city: "Köln",
  user_id: user1.id,
  cat_id: cat1.id
)
Sighting.create(
  longitude: 6.9794,
  latitude: 50.9431,
  last_seen_at: DateTime.now - 5.days,
  description: "Seen playing with leaves in Rheinpark.",
  address: "Rheinparkweg 1",
  city: "Köln",
  user_id: user2.id,
  cat_id: cat2.id
)
Sighting.create(
  longitude: 6.9645,
  latitude: 50.9364,
  last_seen_at: DateTime.now - 3.days,
  description: "Found near the Chocolate Museum, looking for food.",
  address: "Am Schokoladenmuseum 1",
  city: "Köln",
  user_id: user1.id,
  cat_id: cat3.id
)
Sighting.create(
  longitude: 6.9789,
  latitude: 50.9578,
  last_seen_at: DateTime.now - 7.days,
  description: "Walking around near the Zoo entrance.",
  address: "Riehler Str. 173",
  city: "Köln",
  user_id: user2.id,
  cat_id: cat4.id
)
Sighting.create(
  longitude: 7.0192,
  latitude: 51.0322,
  last_seen_at: DateTime.now - 10.days,
  description: "Spotted in Leverkusen, sitting on a bench.",
  address: "Rathaus-Galerie",
  city: "Leverkusen",
  user_id: user1.id,
  cat_id: cat5.id
)
