FactoryBot.define do
  factory :item do
    item {'item'}
    concept {Faker::Lorem.sentence}
    category_id {"2"}
    state_id {"2"}
    delivery_charges_id {"2"}
    prefecture_id {"2"}
    arrival_date_id {"2"}
    price {rand(300..9_999_999)}

    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'image.png')
    end
  end

end
