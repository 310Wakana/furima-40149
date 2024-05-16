FactoryBot.define do
  factory :item do
    image {'image'}
    item {'item'}
    concept {'concept'}
    category_id {2}
    state_id {2}
    delivery_charges_id {2}
    prefecture_id {2}
    arrival_date_id {2}
    price {rand(300..9_999_999)}

    association :user
  end

end
