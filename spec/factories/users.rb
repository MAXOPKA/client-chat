FactoryGirl.define do
  factory :user do
    login 'admin'
    password  '123456'
    password_confirmation '123456'
  end
end
