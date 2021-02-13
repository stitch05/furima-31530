FactoryBot.define do
  password = Faker::Internet.password(min_length: 6)
  factory :user do
    nickname              { "yamada" }
    email                 { Faker::Internet.free_email }
    password              { password }
    password_confirmation { password }
    first_name            { "太郎" }
    last_name             { "山田" }
    first_name_kana            { "タロウ" }
    last_name_kana             { "ヤマダ" }
    birth_day              { "2020-01-01" }
  end
end