FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {'123abc'}
    password_confirmation {password}
    nickname              {'test'}
    birth_date            {'1930-01-01'}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
  end
end