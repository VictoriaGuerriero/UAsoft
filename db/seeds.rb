# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ca = User.create(name: "Claudio", last_name: "Alvarez", email: "calvarez@miuandes.cl", phone: "+56 9 1234 5678", password: "123456")

u1 = User.create(name: "name1", last_name: "last name1", email: "name1@example.com", phone: "+56 9 1111 1111", password: "111111")
u2 = User.create(name: "name2", last_name: "last name2", email: "name2@example.com", phone: "+56 9 2222 2222", password: "222222")
u3 = User.create(name: "name3", last_name: "last name3", email: "name3@example.com", phone: "+56 9 3333 3333", password: "333333")
u4 = User.create(name: "name4", last_name: "last name4", email: "name4@example.com", phone: "+56 9 4444 4444", password: "444444")
u5 = User.create(name: "name5", last_name: "last name5", email: "name5@example.com", phone: "+56 9 5555 5555", password: "555555")

o1u1 = Order.create(user_id: 1)
o2u1 = Order.create(user_id: 1)
o1u1 = Order.create(user_id: 1)

o1u2 = Order.create(user_id: 2)
o2u2 = Order.create(user_id: 2)

o1u3 = Order.create(user_id: 3)

o1u4 = Order.create(user_id: 4)
o2u4 = Order.create(user_id: 4)

takeAndGo = Company.create(name: "Take & Go", email: "takeAndGo@example.com", phone: "+56 9 6969 6969", ubication: "1er Piso edificio Ingenieria", password: "takeAndGo")

p1 = Product.create(name: "product1", price: 1000, information: "information1", description: "desctiption1", company_id: takeAndGo.id)
p2 = Product.create(name: "product2", price: 2000, information: "information2", description: "desctiption2", company_id: takeAndGo.id)
p3 = Product.create(name: "product3", price: 3000, information: "information3", description: "desctiption3", company_id: takeAndGo.id)
p4 = Product.create(name: "product4", price: 4000, information: "information4", description: "desctiption4", company_id: takeAndGo.id)
p5 = Product.create(name: "product5", price: 5000, information: "information5", description: "desctiption5", company_id: takeAndGo.id)
p6 = Product.create(name: "product6", price: 6000, information: "information6", description: "desctiption6", company_id: takeAndGo.id)
p7 = Product.create(name: "product7", price: 7000, information: "information7", description: "desctiption7", company_id: takeAndGo.id)
p8 = Product.create(name: "product8", price: 8000, information: "information8", description: "desctiption8", company_id: takeAndGo.id)
p9 = Product.create(name: "product9", price: 9000, information: "information9", description: "desctiption9", company_id: takeAndGo.id)





