require "faker"

FactoryGirl.define do
  factory :user do
    #pw = Faker::Internet.password(8)
    password '123456'
    password_confirmation '123456'
    email 'vp@gmail.com'

    trait(:admin) {role "admin"; login Faker::Hacker.noun}
    trait(:manager) {role "manager"; login Faker::Hacker.noun}
    trait(:client) {role "client"; login Faker::Hacker.noun}

  end
end
