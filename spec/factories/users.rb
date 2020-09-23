FactoryBot.define do
  factory :user do
    email { "whatever@example.com" }
    password_digest { "password" }
  end
end
