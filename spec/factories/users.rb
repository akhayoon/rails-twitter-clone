# spec/factories/users.rb
require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name            { Faker::Name.first_name }
    f.email           { Faker::Internet.email }
    f.password_digest User.digest('password')
    f.activated       true
  end
end
