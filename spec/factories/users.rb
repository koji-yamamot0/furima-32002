FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Faker::Japanese::Name.last_name}
    first_name            {Faker::Japanese::Name.first_name}
    kana_family           {family_name.yomi}
    kana_first            {first_name.yomi}
    birthday              {"1930-01-01"}
  end
end