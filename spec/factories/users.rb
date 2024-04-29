FactoryBot.define do
    factory :user do
      nickname              {'test'}
      email                 {Faker::Internet.email}
      password              {'000abc'}
      password_confirmation {password}
      first_name            {'名字'}
      last_name             {'名前'}
      first_name_kana       {'ミョウジ'}
      last_name_kana        {'ナマエ'}
      date_of_birth         {'birth'}
    end
  end

  