# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  { login: 'admin', password: 'admin', password_confirmation: 'admin', first_name: 'Администратор', role: 'admin' },
  { login: 'manager', password: 'manager', password_confirmation: 'manager', first_name: 'Менеджер', role: 'manager' },
  { login: 'client', password: 'client', password_confirmation: 'client', first_name: 'Клиент', role: 'client' }
)
