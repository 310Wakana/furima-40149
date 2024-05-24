class RecordAddress
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building, :phone_number, :record, :price, :user_id, :token, :item_id

    with_options presence: true do
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid."}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality 
    validates :house_number
    validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :token
    validates :item_id
    validates :user_id
    end

  

    def save
        @record = Record.create(item_id: item_id, user_id: user_id)
    end
end
