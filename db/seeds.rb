puts "Destroying users..."
User.destroy_all
puts "Destroying projects..."
Project.destroy_all
puts "Destroying boxes..."
Box.destroy_all
puts "Destroying items..."
Item.destroy_all
puts "Destroying tags..."
Tag.destroy_all

puts "Creating John Wick user"
johnwick = User.new(
    email: "johnwick@gmail.com",
    password: "12345678",
    name: "John Wick",
    )
johnwick.save

puts "Creating project"
proj_1 = Project.new(
  name: "project 1",
  user: User.first
)
proj_1.save!

puts "Creating boxes"
box_1 = Box.new(
  name: 'box1',
  comment: 'This is my box # 1 comment',
  qr_code: "1",
  size: "small",
  packing_date: Time.now + 1.day,
  full: false,
  project: Project.first
)
box_1.save!

puts "Creating item"
item_1 = Item.new(
  name: "stapler",
  comment: "this is my favorite stapler",
  box: Box.first,
  project: Project.first,
  packing_date: Time.now + 1.day,
)
item_1.save

puts "creating tags"
kitchen = Tag.new(
  name: "kitchen"
)
kitchen.save
bathroom = Tag.new(
  name: "bathroom"
)
bathroom.save
living_room = Tag.new(
  name: "living room"
)
living_room.save
