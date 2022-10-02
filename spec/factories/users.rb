FactoryBot.define do
  factory :user do
    nick_name             {Faker::Name.initials(number: 2) }
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    first_name            { "山田" }
    last_name             { "太郎" }
    first_name_kana       { "ヤマダ" }
    last_name_kana        { "タロウ" }
    birth                 {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end
