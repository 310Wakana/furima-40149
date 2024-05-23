class RecordAddress
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building, :phone_number, :record, :price, :user_id, :token, :item_id

    validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid."}
    validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality, presence: true
    validates :house_number, presence: true
    validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :token, presence: true

    def save
        if @record.save 
        @record = Record.save(item_id: item_id, user_id: user_id)
        Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building: building, phone_number: phone_number, record_id: record_id).merge(token: params[:token])
        end
    end
end
