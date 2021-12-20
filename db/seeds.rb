# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

owner1 = Owner.create(name:"Bob Thornton")
owner2 = Owner.create(name: "Greg Richardson")

machine1 = owner1.machines.create(location:"Basketball Court Hallway")
machine2 = owner1.machines.create(location:"Hotel lobby")
machine3 = owner2.machines.create(location:"Theater Second Floor")

machine1.snacks.create(name:"Fritos", price:2.00)
machine1.snacks.create(name:"Cheetos", price:1.75)
machine1.snacks.create(name:"Lays Salt and Vinegar Chips", price:2.25)

machine2.snacks.create(name:"Fritos", price:2.00)
machine2.snacks.create(name:"Lays Salt and Vinegar Chips", price:2.25)
machine2.snacks.create(name:"Cheetos", price:1.75)
