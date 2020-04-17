FactoryBot.define do
  factory :user do
    name {'テストユーザー'}
    email {'test1@example.com'}
    password {'password'}
    admin {'t'}
  end
end