FactoryBot.define do
  factory :record_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '横浜市' }
    house_number { '青山１−１' }
    building {'ハイツ青山'}
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
