#Create Users
matt = User.new(
  name:    'Matt',
  email:   'member@example.com',
  password:'helloworld'
  )
matt.skip_confirmation!
matt.save!

dave = User.new(
  name:    'Dave',
  email:   'dave@example.com',
  password:'helloworld'
  )
dave.skip_confirmation!
dave.save!

bruce = User.new(
  name:    'Bruce',
  email:   'bruce@example.com',
  password:'helloworld'
  )
bruce.skip_confirmation!
bruce.save!

puts "Seed Finished"
puts "#{User.count} users created"