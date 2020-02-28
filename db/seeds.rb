# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'open-uri'

puts "Creating users..."


@users = [

{ email: "john@gmail.com", first_name: "John", last_name: "Smith", password: "User1234" },
{ email: "sarah@gmail.com", first_name: "Sarah", last_name: "Williams", password: "User1234" },
{ email: "alex@gmail.com", first_name: "Alex", last_name: "Baker", password: "User1234" },
{ email: "phoebe@gmail.com", first_name: "Phoebe", last_name: "Yu", password: "User1234" }

]

@users.each_with_index do |user, i|
  User.create!(user)
  puts "#{i + 1}. User #{user[:email]} created"
end


puts "Creating chalets..."

@chalets = [

{ name: "Chalet d'Or", description: "Lovely studio with mountain views in the heart of Verbier (150 m from Place Centrale). Big balcony with lots of morning sun. A perfect place for couples or friends to spend quality time in one of the world's best ski resorts.", address: "Verbier, Switzerland", number_of_guests: 3, number_of_bedrooms: 1, price: 250, user_id: 1 },
{ name: "Chalet de Grands Montets", description: "Great 2 bedroom apartment on ground floor in small chalet. Very quiet and private, garage, garden. Close to the center of town. Only 50m from the ski lift, true ski in ski out.", address: "Chamonix, France", number_of_guests: 5, number_of_bedrooms: 2, price: 300, user_id: 2 },
{ name: "Villa Leysin", description: "NEWLY RENOVATED (new wooden floors, kitchen, bathroom, windows, walls...). Location: 4-minute walk from the Médran ski lift and W hotel. Quiet area, private parking space, balcony and partial mountain/valley view.", address: "Leysin, Switzerland", number_of_guests: 7, number_of_bedrooms: 3, price: 450, user_id: 1 },
{ name: "Vue Montana", description: "The apartment is located 2 minutes walk from the local town, 5 minutes walk from Medran ski lift, also right outside a bus stop. The apartment has a large living room with flat screen TV, Wi-Fi and soft furnishings. There is a good sized Italian bathroom, parking, ski lockers and access to a washing machine and dryer.", address: "Crans-Montana, Switzerland", number_of_guests: 8, number_of_bedrooms: 3, price: 550, user_id: 2 },
{ name: "Chalet la Grande Journée", description: "Chalet la Grande Journée at 80 m from the main ski lift. One of the few chalets directly accessible by ski from the main run to the Ruinettes ski-lift. It easily houses four adults and is comfortable for a family of five persons.", address: "Courmayeur, Italy", number_of_guests: 5, number_of_bedrooms: 2, price: 350, user_id: 4 },
{ name: "Villa de Neige", description: "This quaint alpine studio is perfectly located, close to some of the most iconic slopes on both the French and Swiss side of the border. It is also located next to the main round about in the village where free busses pass every 5 minutes in the winter season, making it easy to travel around the area.", address: "Vallorcine, France", number_of_guests: 5, number_of_bedrooms: 2, price: 250, user_id: 4 }

]

path = Rails.root.join('chalets_pictures').to_s
index = 0
Dir.foreach(path) do |dir|
  if dir.include?('chalet') && @chalets[index].present?
    chalet = Chalet.create! @chalets[index]
    puts "directory: #{dir}"
    photos_to_attach = []
    Dir.foreach(File.join(path, dir)) do |file|
      if file.include?('.jpg')
        puts "file: #{file}"
        uploaded_file = Cloudinary::Uploader.upload(File.join(path, dir, file))
        photos_to_attach << { io: URI.open(uploaded_file['secure_url']), filename: file, content_type: 'image/jpg' }
        puts 'uploaded!'
      end
    end
    chalet.update!(photos: photos_to_attach)
    puts "attached!"
    index += 1
  end
end


puts "Done"
