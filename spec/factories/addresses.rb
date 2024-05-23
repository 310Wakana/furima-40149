FactoryBot.define do
  factory :address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '横浜市' }
    house_number { '青山１−１' }
    phone_number { '09012345678' }

    association :record
    
  end
end
