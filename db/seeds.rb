# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create({
    name: "Jane Doe",
    tax_document: "69443151065",
    email: "janedoe@emailhost.com"
})


User.create({
    name: "Pessoa Juridica",
    tax_document: "16233225000128",
    email: "pessoajuridica@emailhost.com"
})

cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

Account.create({
    branch: "0001",
    number: "000001",
    digit: "0",
    password_digest: BCrypt::Password.create("123456", cost: cost),
    balance: 100.55,
    user_id: 1
})

Account.create({
   branch: "0001",
   number: "000002",
   digit: "0",
   password_digest: BCrypt::Password.create("654321", cost: cost),
   balance: 10000.00,
   user_id: 2
})