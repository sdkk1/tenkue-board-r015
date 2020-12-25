FactoryBot.define do
  factory :user do
    name                  { Faker::Games::Pokemon.name }
    email                 { Faker::Internet.free_email }
    password              { '1234567a' }
    password_confirmation { password }
  end
end
