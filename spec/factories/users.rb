require "faker"

FactoryGirl.define do
  factory :user do
    pw = Faker::Internet.password(8)
    password  pw
    password_confirmation pw

    trait(:admin) {role "admin"; login Faker::Hacker.noun}
    trait(:manager) {role "manager"; login Faker::Hacker.noun}
    trait(:client) {role "client"; login Faker::Hacker.noun}

  end
end
