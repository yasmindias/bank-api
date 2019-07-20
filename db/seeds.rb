# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create({
    first_name: "Yasmin Dias",
    tax_document: "69443151065",
    email: "yasmin_dias@emailhost.com"
})


User.create({
    first_name: "Pessoa Juridica",
    tax_document: "16233225000128",
    email: "pessoajuridica@emailhost.com"
})

Account.create({
    branch: "0001",
    number: "000001",
    digit: "0",
    balance: 100.55,
    user_id: 1
})

Account.create({
   branch: "0001",
   number: "000002",
   digit: "0",
   balance: 10000.00,
   user_id: 2
})