require 'open-uri'

# Lösche alle bestehenden Datensätze
Sighting.destroy_all
User.destroy_all
Cat.destroy_all

puts "Creating 4 Users:"
user1 = User.create(email: "john@wayne.com", password: "1234567898")
user2 = User.create(email: "john@wick.com", password: "1234567898")
user3 = User.create(email: "john@lost.com", password: "1234567898")
user4 = User.create(email: "john@bro.com", password: "1234567898")

puts "Creating 4 Cats lost and 3 Cats found:"

cat1 = Cat.create(
  name: "Luna",
  description: "A playful and curious kitten who loves chasing shadows and exploring. Full of energy, they bring joy with their antics and balance it with sweet moments of cuddling.",
  race: "British Shorthair",
  eye_color: "Green",
  color: "Gray",
  fur: "Short",
  found: false,
  user_id: user3.id,
  city: "Köln",
  origin_address: "Weisenhausgasse 20, Köln, Deutschland",
  created_at: Time.now - rand(15..20).days
)
cat1.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_960_720.jpg'),
  filename: 'photo.jpg',
  content_type: 'image/jpeg'
)

cat2 = Cat.create(
  name: "Simba",
  description: "Simba is finally back in his Kingdom. I want to thank you all for your help and support. <3333",
  race: "Maine Coon",
  eye_color: "Hazel",
  color: "Brown",
  fur: "Long",
  found: true,
  user_id: user2.id,
  city: "Köln",
  origin_address: "Neumarkt 1, Köln, Deutschland",
  created_at: Time.now - rand(15..20).days
)
cat2.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2017/08/07/16/36/cat-2605502_960_720.jpg'),
  filename: 'photo.jpg',
  content_type: 'image/jpeg'
)

cat3 = Cat.create(
  name: "Bella",
  description: "She is a very scared cat. Please approach with care",
  race: "Sphynx",
  eye_color: "Blue",
  color: "Pink",
  fur: "None",
  found: false,
  user_id: user1.id,
  city: "Köln",
  origin_address: "Friesenstraße 15, Köln, Deutschland",
  created_at: Time.now - rand(15..20).days
)
cat3.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2022/12/31/14/32/cat-7688749_960_720.jpg'),
  filename: 'photo.jpg',
  content_type: 'image/jpeg'
)

cat4 = Cat.create(
  name: "Leo",
  description: "He is a very open cat. If you pet him he would stay with you. Please contact us!",
  race: "Abyssinian",
  eye_color: "Yellow",
  color: "Ruddy",
  fur: "Short",
  found: false,
  user_id: user2.id,
  city: "Köln",
  origin_address: "Rudolfplatz 5, Köln, Deutschland",
  created_at: Time.now - rand(15..20).days
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
  created_at: Time.now - rand(15..20).days
)
cat5.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2021/12/17/19/15/pet-6877246_960_720.jpg'),
  filename: 'photo.jpg',
  content_type: 'image/jpeg'
)

cat6 = Cat.create(
  name: "Milo",
  description: "He has a little scar on his right eye. Very shy, please approach with care.",
  race: "Bengal",
  eye_color: "Green",
  color: "Brown Spotted",
  fur: "Short",
  found: false,
  user_id: user1.id,
  city: "Köln",
  origin_address: "Domkloster 4, Köln, Deutschland",
  created_at: Time.now - rand(15..20).days
)
cat6.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2015/11/16/22/14/cat-1046544_960_720.jpg'),
  filename: 'photo.jpg',
  content_type: 'image/jpeg'
)

cat7 = Cat.create(
  name: "Nala",
  description: "Thank you very much all for your help. Nala has been found and is back scratching my sofa :DDD",
  race: "Siamese",
  eye_color: "Blue",
  color: "Cream with Dark Points",
  fur: "Short",
  found: true,
  user_id: user2.id,
  city: "Köln",
  origin_address: "Heumarkt 50, Köln, Deutschland",
  created_at: Time.now - rand(15..20).days
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
  created_at: Time.now - rand(15..20).days
)
cat8.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2017/02/15/12/12/cat-2068462_960_720.jpg'),
  filename: 'cat8.jpg',
  content_type: 'image/jpeg'
)

cat9 = Cat.create(
  name: "Oscar",
  description: "Oscar i finally back home and i coudnt be happier. Thank you all for your help :)",
  race: "Persian",
  eye_color: "Blue",
  color: "White",
  fur: "Long",
  found: true,
  user_id: user2.id,
  city: "Köln",
  origin_address: "Domstraße 3, Köln, Deutschland",
  created_at: Time.now - rand(15..20).days
)
cat9.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2023/07/12/07/07/cat-8121892_960_720.jpg'),
  filename: 'cat9.jpg',
  content_type: 'image/jpeg'
)

cat10 = Cat.create(
  name: "Tigger",
  description: "A very dorky cat who is easily lured with food. If you see him please contact us!",
  race: "Maine Coon",
  eye_color: "Hazel",
  color: "Orange",
  fur: "Long",
  found: false,
  user_id: user1.id,
  city: "Leverkusen",
  origin_address: "Carl-Duisberg-Straße 7, Leverkusen, Deutschland",
  created_at: Time.now - rand(15..20).days
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
  created_at: Time.now - rand(15..20).days
)
cat11.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2023/09/18/13/51/cat-8260638_960_720.jpg'),
  filename: 'cat11.jpg',
  content_type: 'image/jpeg'
)

cat12 = Cat.create(
  name: "Loki",
  description: "My daughter is so happy that her best friend is back home. Thank your all from the bottom of my heart.",
  race: "Siamese",
  eye_color: "Blue",
  color: "Cream",
  fur: "Short",
  found: true,
  user_id: user1.id,
  city: "Köln",
  origin_address: "Heinrich-Böll-Platz, Köln, Deutschland",
  created_at: Time.now - rand(15..20).days
)
cat12.photo.attach(
  io: URI.open('https://cdn.pixabay.com/photo/2015/06/19/14/20/cat-814952_960_720.jpg'),
  filename: 'cat12.jpg',
  content_type: 'image/jpeg'
)

koeln_addresses = [
  "Domkloster 4, Köln", "Neumarkt 1, Köln", "Rudolfplatz 5, Köln", "Heinrich-Böll-Platz, Köln",
  "Hohenzollernring 22, Köln", "Aachener Straße 125, Köln", "Zülpicher Straße 29, Köln", "Venloer Straße 234, Köln",
  "Friesenplatz 10, Köln", "Ehrenstraße 43, Köln", "Schildergasse 15, Köln", "Breite Straße 85, Köln",
  "Hohe Straße 62, Köln", "Chlodwigplatz 4, Köln", "Ebertplatz 3, Köln", "Eigelstein 120, Köln",
  "Weidengasse 45, Köln", "Sülzgürtel 90, Köln", "Luxemburger Straße 200, Köln", "Severinstraße 125, Köln",
  "Barbarossaplatz 7, Köln", "Roonstraße 67, Köln", "Bismarckstraße 9, Köln", "Hansaring 78, Köln",
  "Lindenthalgürtel 61, Köln", "Bonner Straße 210, Köln", "Universitätsstraße 33, Köln", "Kalker Hauptstraße 150, Köln",
  "Deutzer Freiheit 64, Köln", "Dürener Straße 106, Köln",
  "Venloer Wall 9, Köln", "Stolberger Straße 80, Köln", "Subbelrather Straße 250, Köln", "Gereonsstraße 4, Köln", "Buchforststraße 43, Köln", "Parkstraße 11, Köln", "Tunisstraße 8, Köln",
  "Richmodstraße 20, Köln", "Rheingasse 18, Köln", "Deutz-Mülheimer Straße 124, Köln", "Hans-Böckler-Platz 3, Köln",
  "Holzgasse 14, Köln", "Komödienstraße 42, Köln", "Clevischer Ring 23, Köln", "Im Mediapark 7, Köln",
  "Bayenthalgürtel 5, Köln"
].shuffle

bonn_addresses = [
  "Markt 1, Bonn", "Kaiserplatz 11, Bonn", "Poppelsdorfer Allee, Bonn", "Oxfordstraße 17, Bonn",
  "Am Hofgarten 6, Bonn", "Friedensplatz 12, Bonn", "Rheinaustraße 42, Bonn", "Berliner Freiheit 36, Bonn",
  "Beethovenplatz 7, Bonn", "Sternstraße 8, Bonn", "Belderberg 15, Bonn", "Wesselstraße 10, Bonn",
  "Thomas-Mann-Straße 15, Bonn", "Kölnstraße 50, Bonn", "Rathausgasse 8, Bonn", "Friedrichstraße 55, Bonn",
  "Baumschulallee 6, Bonn", "Lennéstraße 12, Bonn", "Fabrikstraße 22, Bonn", "Hermannstraße 27, Bonn",
  "Meckenheimer Allee 31, Bonn", "Prinz-Albert-Straße 9, Bonn", "Am Hauptbahnhof 1, Bonn", "Heerstraße 13, Bonn",
  "Arndtstraße 3, Bonn", "Adenauerallee 215, Bonn", "Wilhelmstraße 44, Bonn", "Rosental 16, Bonn",
  "Eduard-Otto-Straße 11, Bonn", "Bonngasse 20, Bonn", "Graurheindorfer Straße 34, Bonn", "Endenicher Allee 51, Bonn",
  "Burbacher Straße 45, Bonn", "Ernst-Moritz-Arndt-Straße 19, Bonn", "Augustusring 28, Bonn", "Zehntenhofstraße 77, Bonn",
  "Bornheimer Straße 21, Bonn", "Franzstraße 36, Bonn", "Dorotheenstraße 47, Bonn", "Bertha-von-Suttner-Platz 5, Bonn",
  "Johanniterstraße 38, Bonn", "Immenburgstraße 3, Bonn", "Godesberger Allee 80, Bonn",
  "Kennedyallee 35, Bonn", "Dottendorfer Straße 27, Bonn", "Münsterstraße 19, Bonn",
  "Maxstraße 10, Bonn"
].shuffle

leverkusen_addresses = [
  "Bahnhofstraße 8, Leverkusen", "Carl-Duisberg-Straße 7, Leverkusen", "Leverkusen Mitte, Leverkusen",
  "Kaiser-Wilhelm-Allee 24, Leverkusen", "Opladener Straße 44, Leverkusen", "Bismarckstraße 9, Leverkusen",
  "Hauptstraße 3, Leverkusen", "Wupperstraße 12, Leverkusen", "Düsseldorfer Straße 22, Leverkusen",
  "Birkenbergstraße 7, Leverkusen", "Kölner Straße 26, Leverkusen", "Berliner Platz 5, Leverkusen",
  "Alkenrather Straße 18, Leverkusen", "Goethestraße 9, Leverkusen", "Mittelstraße 4, Leverkusen",
  "Dönhoffstraße 14, Leverkusen", "Quettinger Straße 20, Leverkusen", "Rheindorfer Straße 30, Leverkusen",
  "Hitdorfer Straße 6, Leverkusen", "Morsbroicher Straße 10, Leverkusen",
  "Haberstraße 32, Leverkusen", "Industriestraße 21, Leverkusen", "Königsberger Platz 2, Leverkusen",
  "Robert-Blum-Straße 11, Leverkusen", "Willy-Brandt-Ring 13, Leverkusen", "Bahnhofstraße 28, Leverkusen",
  "Heinrich-Brüning-Straße 14, Leverkusen", "Bergische Landstraße 15, Leverkusen",
  "Dhünnstraße 4, Leverkusen", "Leverkusen-Bürrig, Leverkusen", "Manforter Straße 17, Leverkusen",
  "Gustav-Heinemann-Straße 23, Leverkusen", "Mozartstraße 18, Leverkusen", "Mühlenweg 30, Leverkusen",
  "Nordstraße 27, Leverkusen", "Münsters Gässchen 5, Leverkusen", "Alteberger Straße 31, Leverkusen",
  "Elisabethstraße 9, Leverkusen", "Wiesdorfer Platz 14, Leverkusen", "Scharnhorststraße 10, Leverkusen",
  "Europaring 22, Leverkusen", "Borsigstraße 17, Leverkusen", "Birkenbergstraße 14, Leverkusen",
  "Im Eisholz 1, Leverkusen", "Schlebuscher Straße 23, Leverkusen", "Bebelstraße 12, Leverkusen"
].shuffle

puts "Created 5 sightings for Luna-Cat1 (user3 = john@lost.com) in Köln with user2.id & user1.id"

Sighting.create!(
  cat: cat1,
  user_id: user2.id,
  address: "Domkloster 4, Köln" ,  # Nimm die Adresse und entferne sie aus dem Array
  city: "Köln",
  last_seen_at: Time.now - 1.days,
  description: "I think I spotted Luna resting near the cathedral, looking a bit tired.",
  status: "pending"
)

Sighting.create!(
  cat: cat1,
  user_id: user1.id,
  address: "Neumarkt 1, Köln",  # Nimm die Adresse und entferne sie aus dem Array
  city: "Köln",
  last_seen_at: Time.now - 2.days,
  description: "Near Neumarkt, Luna seemed weak and was moving very slowly.",
  status: "pending"
)
Sighting.create!(
  cat: cat1,
  user_id: user2.id,
  address: "Heumarkt 50, Köln" ,  # Nimm die Adresse und entferne sie aus dem Array
  city: "Köln",
  last_seen_at: Time.now - 5.days,
  description: "Pretty sure I saw Luna wandering near Heumarkt, her fur a bit dirty and unkempt.",
  status: "accepted"
)
Sighting.create!(
  cat: cat1,
  user_id: user1.id,
  address: "Rudolfplatz 5, Köln" ,  # Nimm die Adresse und entferne sie aus dem Array
  city: "Köln",
  last_seen_at: Time.now - 7.days,
  description: "Luna was likely seen hiding at Rudolfplatz, looking anxious and weary.",
  status: "accepted"
)
Sighting.create!(
  cat: cat1,
  user_id: user1.id,
  address: "Friesenstraße 15, Köln" ,  # Nimm die Adresse und entferne sie aus dem Array
  city: "Köln",
  last_seen_at: Time.now - 10.days,
  description: "I might have spotted Luna on Friesenstraße, looking calm and relaxed",
  status: "accepted"
)


puts "Creating new Sightings to cat2 - cat12:"

# Sightings für jede Katze erstellen
cats = [cat2, cat3, cat4, cat5, cat6, cat7, cat8, cat9, cat10, cat11, cat12]

cats.each do |cat|
  city = cat.city
  case city
  when "Köln"
    addresses = koeln_addresses
  when "Bonn"
    addresses = bonn_addresses
  when "Leverkusen"
    addresses = leverkusen_addresses
  else
    next
  end

  rand(1..5).times do
    Sighting.create!(
      cat: cat,
      user_id: cat.user_id,
      address: addresses.shift,
      city: city,
      last_seen_at: Time.now - rand(1..14).days,
      description: "Sighting of #{cat.name} in #{city}",
      status: "accepted"
    )
  end
end


# Allgemeine Sightings für die Städte erstellen
puts "Creating 10 general sightings for Köln, Leverkusen, Bonn:"

# Städte und Adressen
cities = {
  "Köln" => koeln_addresses,
  "Bonn" => bonn_addresses,
  "Leverkusen" => leverkusen_addresses
}

# Bilder für Sichtungen ohne cat_id
images = [
  'https://cdn.pixabay.com/photo/2019/05/21/07/11/cat-4218424_960_720.jpg',
  'https://cdn.pixabay.com/photo/2018/03/27/17/25/cat-3266673_960_720.jpg',
  'https://cdn.pixabay.com/photo/2022/10/15/21/23/cat-7523894_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/11/26/07/41/maine-coon-5778153_960_720.jpg',
  'https://cdn.pixabay.com/photo/2018/11/29/23/34/cat-3846780_960_720.jpg',
  'https://cdn.pixabay.com/photo/2016/02/10/16/37/cat-1192026_960_720.jpg'
].shuffle

cities.each do |city, addresses|

  cat_sighting_descriptions = [
  "Spotted a cat lounging on the windowsill, enjoying the morning sun.",
  "Saw a playful kitten chasing its tail in the backyard garden.",
  "Observed a cat calmly resting on the fence, watching the neighborhood activities.",
  "Noticed a stray cat hiding under a bench, seeking shelter from the rain.",
  "A sleek gray cat was seen darting across the street early this morning.",
  "Found a cat napping peacefully on a pile of leaves in the park.",
  "Witnessed a fluffy white cat curiously exploring the flower beds in the yard.",
  "Saw a cat perched on a rooftop, scanning the surroundings with keen eyes.",
  "Spotted a cat grooming itself on the porch, looking clean and content.",
  "Noticed a cat playfully pouncing on fallen leaves in the autumn breeze.",
  "Observed a tabby cat lounging on a car hood, enjoying the warmth.",
  "Saw a cat wandering near the playground, cautiously approaching children.",
  "Found a calico cat curled up in a cozy corner of the garden shed.",
  "Witnessed a cat racing through the alleyway, chasing an elusive object.",
  "Spotted a cat perched on a high tree branch, surveying its territory.",
  "Saw a cat eating from a bowl left out on the front steps.",
  "Noticed a cat darting between parked cars, exploring its urban surroundings.",
  "Found a cat nestled in a basket of fresh laundry, looking snug.",
  "Observed a cat sitting on a windowsill, watching raindrops fall outside.",
  "Saw a cat playing with a toy mouse in the living room.",
  "Noticed a cat calmly strolling down the sidewalk, completely at ease.",
  "Found a cat hiding in the bushes, peeking out with curious eyes.",
  "Spotted a cat resting in a sunbeam on a comfy chair.",
  "Saw a cat darting into an open garage, searching for a hiding spot.",
  "Observed a cat sitting on the garden wall, enjoying the sunset view.",
  "Found a cat stretching lazily on a warm stone path.",
  "Witnessed a cat trotting along the park path, tail held high.",
  "Spotted a cat leaping gracefully onto a high fence, then disappearing over it.",
  "Noticed a cat napping in a patch of sunlight on the grass.",
  "Saw a cat watching birds from the safety of a bush.",
  "Found a cat pawing at the edge of a fountain, fascinated by the water.",
  "Observed a cat lying flat on the ground, soaking in the afternoon sun.",
  "Spotted a cat peeking out from behind a garden gnome, curious and alert."
]

  # Erstelle 2 Sichtungen mit Bild
  2.times do
    image_url = images.shift
    new_sighting = Sighting.create!(
      cat: nil,
      user_id: user2.id,
      address: addresses.shift,
      city: city,
      last_seen_at: Time.now - rand(1..14).days,
      description: cat_sighting_descriptions.shift,
      status: "accepted",
      photo: {
        io: URI.open(image_url),
        filename: File.basename(image_url),
        content_type: 'image/jpeg'
      }
    )
  end
  # Erstelle 8 allgemeine Sichtungen
  8.times do
    Sighting.create!(
      cat: nil,
      user_id: user2.id,
      address: addresses.shift,
      city: city,
      last_seen_at: Time.now - rand(1..14).days,
      description: cat_sighting_descriptions.shift,
      status: "accepted"
    )
  end
end


puts "Seeding completed!"
