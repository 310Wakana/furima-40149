FactoryBot.define do
    factory :user do
      nickname              {'test'}
      email                 {'test@example'}
      password              {'000abc'}
      password_confirmation {password}
      first_name            {'first_name'}
      last_name             {'last_name'}
      first_name_kana       {'first_name_kana'}
      last_name_kana        {'last_name_kana'}
      date_of_birth         {'date_of_birth'}
    end
  end

  