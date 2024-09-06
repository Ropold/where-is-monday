# Lösche alle bestehenden Datensätze
Sighting.destroy_all
User.destroy_all
Cat.destroy_all

puts "Creating 2 Users:"
user1 = User.create(email: "john@wayne.com", password: "1234567898")
user2 = User.create(email: "john@wick.com", password: "1234567898")

puts "Creating 4 Cats lost and 3 Cats found:"


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
)
cat1.photo.attach(
  io: URI.open(Cloudinary::Utils.cloudinary_url('https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_960_720.jpg')),
  filename: 'photo.jpg',
  content_type: 'image/jpeg'
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
)
cat2.photo.attach(
  io: URI.open(Cloudinary::Utils.cloudinary_url('https://cdn.pixabay.com/photo/2017/08/07/16/36/cat-2605502_960_720.jpg')),
  filename: 'photo.jpg',
  content_type: 'image/jpeg'
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
)

cat3.photo.attach(
  io: URI.open(Cloudinary::Utils.cloudinary_url('https://cdn.pixabay.com/photo/2022/12/31/14/32/cat-7688749_960_720.jpg')),
  filename: 'photo.jpg',
  content_type: 'image/jpeg'
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
)
cat4.photo.attach(
  io: URI.open(Cloudinary::Utils.cloudinary_url('https://cdn.pixabay.com/photo/2017/03/14/14/49/cat-2143332_960_720.jpg')),
  filename: 'photo.jpg',
  content_type: 'image/jpeg'
)

cat5 = Cat.create(
  name: "Max",
  description: "A calm and friendly cat who loves the outdoors.",
  race: "Ragdoll",
  eye_color: "Blue",
  color: "White and Brown",
  fur: "Long",
  found: false,
  user_id: user1.id,
  city: "Leverkusen",
  origin_address: "Bahnhofstraße 8, Leverkusen, Deutschland",
)
cat5.photo.attach(
  io: URI.open(Cloudinary::Utils.cloudinary_url('https://cdn.pixabay.com/photo/2021/12/17/19/15/pet-6877246_960_720.jpg')),
  filename: 'photo.jpg',
  content_type: 'image/jpeg'
)
cat6 = Cat.create(
  name: "Milo",
  description: "A curious cat who loves to explore new places.",
  race: "Bengal",
  eye_color: "Green",
  color: "Brown Spotted",
  fur: "Short",
  found: true,
  user_id: user1.id,
  city: "Köln",
  origin_address: "Domkloster 4, Köln, Deutschland",
)
cat6.photo.attach(
  io: URI.open(Cloudinary::Utils.cloudinary_url('https://cdn.pixabay.com/photo/2015/11/16/22/14/cat-1046544_960_720.jpg')),
  filename: 'photo.jpg',
  content_type: 'image/jpeg'
)

cat7 = Cat.create(
  name: "Nala",
  description: "A playful cat who enjoys chasing toys and interacting with people.",
  race: "Siamese",
  eye_color: "Blue",
  color: "Cream with Dark Points",
  fur: "Short",
  found: true,
  user_id: user2.id,
  city: "Köln",
  origin_address: "Heumarkt 50, Köln, Deutschland",
)
cat7.photo.attach(
  io: URI.open(Cloudinary::Utils.cloudinary_url('https://cdn.pixabay.com/photo/2015/12/04/21/53/cat-1077516_960_720.jpg')),
  filename: 'photo.jpg',
  content_type: 'image/jpeg'
)


puts "Creating 7 Sightings:"

Sighting.create(
  last_seen_at: DateTime.now - 2.days,
  description: "Spotted near the Cologne Cathedral, climbing a tree.",
  address: "Domkloster 4",
  city: "Köln",
  user_id: user1.id,
  cat_id: cat1.id
)

Sighting.create(
  last_seen_at: DateTime.now - 5.days,
  description: "Seen playing with leaves in Rheinpark.",
  address: "Rheinparkweg 1",
  city: "Köln",
  user_id: user2.id,
  cat_id: cat2.id
)

Sighting.create(
  last_seen_at: DateTime.now - 3.days,
  description: "Found near the Chocolate Museum, looking for food.",
  address: "Am Schokoladenmuseum 1",
  city: "Köln",
  user_id: user1.id,
  cat_id: cat3.id
)

Sighting.create(
  last_seen_at: DateTime.now - 7.days,
  description: "Walking around near the Zoo entrance.",
  address: "Riehler Str. 173",
  city: "Köln",
  user_id: user2.id,
  cat_id: cat4.id
)

Sighting.create(
  last_seen_at: DateTime.now - 10.days,
  description: "Spotted in Leverkusen, sitting on a bench.",
  address: "Leverkusen Mitte",
  city: "Leverkusen",
  user_id: user1.id,
  cat_id: cat4.id
)


Sighting.create(
  last_seen_at: DateTime.now - 10.days,
  description: "Spotted in Leverkusen, sitting on a bench.",
  address: "Leverkusen Mitte",
  city: "Leverkusen",
  user_id: user1.id,
  cat_id: cat5.id
)

Sighting.create(
  last_seen_at: DateTime.now - 9.days,
  description: "Spottecadcw in Leverkusen, sitting on a bench.",
  address: "Shadow-Arcaden Düsseldorf",
  city: "Düsseldorf",
  user_id: user1.id,
  cat_id: cat5.id
)
