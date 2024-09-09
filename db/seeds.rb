require 'open-uri'

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
  io: URI.open('https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_960_720.jpg'),
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
  io: URI.open('https://cdn.pixabay.com/photo/2017/08/07/16/36/cat-2605502_960_720.jpg'),
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
  io: URI.open('https://cdn.pixabay.com/photo/2022/12/31/14/32/cat-7688749_960_720.jpg'),
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
  io: URI.open('https://cdn.pixabay.com/photo/2017/03/14/14/49/cat-2143332_960_720.jpg'),
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
  io: URI.open('https://cdn.pixabay.com/photo/2021/12/17/19/15/pet-6877246_960_720.jpg'),
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
  io: URI.open('https://cdn.pixabay.com/photo/2015/11/16/22/14/cat-1046544_960_720.jpg'),
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
  io: URI.open('https://cdn.pixabay.com/photo/2015/12/04/21/53/cat-1077516_960_720.jpg'),
  filename: 'photo.jpg',
  content_type: 'image/jpeg'
)

puts "Creating 5 additional Cats:"

# Neue Katzen hinzufügen

cat8 = Cat.create(
  name: "Mimi",
  description: "A curious and adventurous little cat.",
  race: "European Shorthair",
  eye_color: "Green",
  color: "Gray",
  fur: "Short",
  found: false,
  user_id: user1.id,
  city: "Bonn",
  origin_address: "Markt 1, Bonn, Deutschland",
)
cat8.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2017/02/15/12/12/cat-2068462_960_720.jpg'),
  filename: 'cat8.jpg',
  content_type: 'image/jpeg'
)

cat9 = Cat.create(
  name: "Oscar",
  description: "A playful kitten who loves to climb furniture.",
  race: "Persian",
  eye_color: "Blue",
  color: "White",
  fur: "Long",
  found: true,
  user_id: user2.id,
  city: "Köln",
  origin_address: "Domstraße 3, Köln, Deutschland",
)
cat9.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2023/07/12/07/07/cat-8121892_960_720.jpg'),
  filename: 'cat9.jpg',
  content_type: 'image/jpeg'
)

cat10 = Cat.create(
  name: "Tigger",
  description: "Loves to play in the garden and chase birds.",
  race: "Maine Coon",
  eye_color: "Hazel",
  color: "Orange",
  fur: "Long",
  found: false,
  user_id: user1.id,
  city: "Leverkusen",
  origin_address: "Carl-Duisberg-Straße 7, Leverkusen, Deutschland",
)
cat10.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2017/11/09/21/41/cat-2934720_960_720.jpg'),
  filename: 'cat10.jpg',
  content_type: 'image/jpeg'
)

cat11 = Cat.create(
  name: "Shadow",
  description: "A quiet cat who loves to nap in the sun.",
  race: "Sphynx",
  eye_color: "Yellow",
  color: "Pink",
  fur: "None",
  found: false,
  user_id: user2.id,
  city: "Bonn",
  origin_address: "Kaiserplatz 11, Bonn, Deutschland",
)
cat11.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2023/09/18/13/51/cat-8260638_960_720.jpg'),
  filename: 'cat11.jpg',
  content_type: 'image/jpeg'
)

cat12 = Cat.create(
  name: "Loki",
  description: "Very clever, loves to figure out puzzles.",
  race: "Siamese",
  eye_color: "Blue",
  color: "Cream",
  fur: "Short",
  found: true,
  user_id: user1.id,
  city: "Köln",
  origin_address: "Heinrich-Böll-Platz, Köln, Deutschland",
)
cat12.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2015/06/19/14/20/cat-814952_960_720.jpg'),
  filename: 'cat12.jpg',
  content_type: 'image/jpeg'
)

puts "Creating 30 new Sightings:"

30.times do |i|
  city = ['Köln', 'Bonn', 'Leverkusen'].sample
  address = case city
            when 'Köln'
              ["Domkloster 4, Köln", "Neumarkt 1, Köln", "Rudolfplatz 5, Köln", "Heinrich-Böll-Platz, Köln"].sample
            when 'Bonn'
              ["Markt 1, Bonn", "Kaiserplatz 11, Bonn", "Poppelsdorfer Allee, Bonn"].sample
            when 'Leverkusen'
              ["Bahnhofstraße 8, Leverkusen", "Carl-Duisberg-Straße 7, Leverkusen", "Leverkusen Mitte, Leverkusen"].sample
            end

  sighting_time = DateTime.now - rand(1..20).days

  if i < 20
    if i.even? # Prüfen, ob der Index gerade ist
      cat = Cat.all.sample
      Sighting.create(
        last_seen_at: sighting_time,
        description: "Seen near #{address}, looks healthy.",
        address: address,
        city: city,
        user_id: [user1.id, user2.id].sample,
        cat_id: cat.id
      )
    else
      sighting = Sighting.create(
        last_seen_at: sighting_time,
        description: "A stray cat was seen wandering near #{address}.",
        address: address,
        city: city,
        user_id: [user1.id, user2.id].sample,
        cat_id: nil
      )

      # Bilder für Sightings ohne `cat_id` hinzufügen
      images = [
        'https://cdn.pixabay.com/photo/2019/05/21/07/11/cat-4218424_960_720.jpg',
        'https://cdn.pixabay.com/photo/2018/03/27/17/25/cat-3266673_960_720.jpg',
        'https://cdn.pixabay.com/photo/2022/10/15/21/23/cat-7523894_960_720.jpg',
        'https://cdn.pixabay.com/photo/2020/11/26/07/41/maine-coon-5778153_960_720.jpg',
        'https://cdn.pixabay.com/photo/2018/11/29/23/34/cat-3846780_960_720.jpg'
      ]

      sighting.photo.attach(
        io: URI.open(images[i % images.length]),
        filename: "sighting_no_cat_#{i}.jpg",
        content_type: 'image/jpeg'
      )
    end
  end
end

puts "Seeding completed!"
