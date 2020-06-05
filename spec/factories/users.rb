FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    password { Faker::Company.name }
    email { Faker::Internet.email }
  end
end