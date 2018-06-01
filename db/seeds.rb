# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# alex = User.create!({email: "alex@alex.com", password: "123456", first_name: "alex", last_name:"sell", bio: "i like dogs", date_of_birth: "01/01/1999", photo: "hello", postcode: "sl37tf"})
# homeless = Recipient.new({first_name:  "gio", last_name: "panininilessss", gender: "Male", date_of_birth: "01/01/1999", bio:"i like paninis", phone_number: "01784882933"})
# homeless.users = alex
# homeless.savep
puts "clearing db"
Payment.destroy_all
Contribution.destroy_all
Item.destroy_all
Location.destroy_all
Recipient.destroy_all
User.destroy_all

puts "creating users"


ben = User.create!(email: "user@gmail.com", first_name: "Ben", last_name: "Smith", password: "password", date_of_birth: "02/05/1982", gender: "Male", postcode: "E2 8DY", bio: "Happy to help! I wanted to be more involved in the community, so here I am <3")
melvin = User.create!(email: "melvin@gmail.com", first_name: "Melvin", last_name: "Something German", password: "password", date_of_birth: "05/05/1992", gender: "Male", postcode: "E2 9DT", bio: "Looking for more life fulfillment, so therefore helping people. I got a lot to make up to people.")
hedi = User.create!(email: "hedi@gmail.com", first_name: "Hedi", last_name: "Holland", password: "password", date_of_birth: "26/04/1984", gender: "Female", postcode: "EC1Y 1BE", bio: "I'm not sure what I'm doing here! I was trying to rent some clothes online, I don't think this is right?")

puts "creating recipients"

tim = Recipient.create!(user: ben, first_name: "Tim", gender: "Male", date_of_birth: "14/02/1986", bio: "Tim is down on his luck. He just needs a helping hand. He is quite comfortable living in his cardboard box, but the winters are cold! He also has a cute dog that keeps him company.", remote_photo_url: "https://i1.wp.com/freewayphotography.com/wp-content/uploads/2018/02/Headshot-Photographer-Tampa-04.jpg?resize=500%2C500&ssl=1")
gio = Recipient.create!(user: melvin, first_name: "Gio", gender: "Male", date_of_birth: "10/12/1983", bio: "Gio was fired from his job after yelling at a dog for eating his panini. Please help him get back on his feet.", remote_photo_url: "http://kylenelson.com/wp-content/uploads/2017/03/Jaycob-Headshot-1-2.jpg")
jose = Recipient.create!(user: melvin, first_name: "Jose", gender: "Male", date_of_birth: "10/01/1983", bio: "Jose cannot speak english very well and needs a place to stay when the winters are cold.", remote_photo_url: "https://www.google.co.uk/search?q=homeless+person&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjjy7Sc1rLbAhWBNcAKHewTBHsQ_AUICigB&biw=1231&bih=642#imgrc=oFUlTENmoeRmmM")
mike = Recipient.create!(user: hedi, first_name: "Mike", gender: "Male", date_of_birth: "15/04/1983", bio: "Mike lives under a bridge in central London and takes care of his two older dogs who are his best friends.", remote_photo_url: "https://www.google.co.uk/search?q=homeless+person&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjjy7Sc1rLbAhWBNcAKHewTBHsQ_AUICigB&biw=1231&bih=642#imgrc=Peb1XYKv6A-jGM")
john = Recipient.create!(user: ben, first_name: "John", gender: "Male", date_of_birth: "12/11/1982", bio: "John is trying to get out of situation by having several small jobs which unfortunetly do not pay enough for a appartment.", remote_photo_url: "https://www.google.co.uk/search?q=homeless+person&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjjy7Sc1rLbAhWBNcAKHewTBHsQ_AUICigB&biw=1231&bih=642#imgrc=lPtALQO4DOvahM:")
puts "creating locations"
location1 = Location.create!(recipient: tim, address: "E2 8DY", primary: true)
location2 = Location.create!(recipient: tim, address: "E2 9DY")
location3 = Location.create!(recipient: tim, address: "E2 3DY")
puts "creating items"

Item.create!(recipient: tim, title: "sleeping bag", category: "Living", price_cents: "5000", description: "warm and fluffy")
Item.create!(recipient: gio, title: "panini", category: "Leisure", price_cents: "500", description: "it's.... food?")
Item.create!(recipient: jose, title: "dog food", category: "Food", price_cents: "200", description: "food for a hungry dog?")
Item.create!(recipient: mike, title: "medicine for dog", category: "Medicine", price_cents: "500", description: "older dog needs medicine")
Item.create!(recipient: john, title: "tent", category: "Leisure", price_cents: "500", description: "need shelter from the cold nights in London")
puts "all done, go team!"

