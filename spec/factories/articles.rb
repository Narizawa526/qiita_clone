FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph_by_chars}
    user_id { Faker::Internet.uuid }
    user
  end
end
