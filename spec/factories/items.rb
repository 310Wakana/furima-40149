FactoryBot.define do
  factory :item do

    item {'item'}
    concept {'concept'}
    category_id {2}
    state_id {2}
    delivery_charges_id {2}
    prefecture_id {2}
    arrival_date_id {2}
    price {'1000'}
  
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end

end
