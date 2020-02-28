# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "Creating users..."


@users = [

{ email: "john@gmail.com", first_name: "John", last_name: "Smith", password: "User1234"}

]

@users.each_with_index do |user, i|
  User.create!(user)
  puts "#{i + 1}. User #{user[:email]} created"
end


puts "Creating chalets..."

@chalets = [

{ name: "Chalet d'Or", description: "A cosy chalet in a magnificent location", address: "Verbier, Switzerland", number_of_guests: 5, number_of_bedrooms: 2, price: 250, user_id: 1 }
]
path =Rails.root.join('chalets_pictures').to_s
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
