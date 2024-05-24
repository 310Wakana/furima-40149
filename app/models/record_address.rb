class RecordAddress
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building, :phone_number, :record_id, :price, :user_id, :token, :item_id

    with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid."}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :token
    validates :item_id
    validates :user_id
    end

  

    def save
        @record = Record.create(item_id: item_id, user_id: user_id)
        @address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building: building, phone_number: phone_number, record_id: @record.id)
    end
end
