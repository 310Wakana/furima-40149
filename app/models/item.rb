class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one_attached :image
    belongs_to :category
    belongs_to :state
    belongs_to :delivery_charges
    belongs_to :prefecture
    belongs_to :arrival_date

    validates :image, presence: true
    validates :item, presence: true
    validates :concept, presence: true

    validates :category, presence: true, numericality: { other_than: 1 , message: "Category can't be blank"}
    validates :state, presence: true, numericality: { other_than: 1 , message: "State can't be blank"}
    validates :delivery_charges, presence: true, numericality: { other_than: 1 , message: "Delivery_charges can't be blank"}
    validates :prefecture, presence: true, numericality: { other_than: 1 , message: "Prefecture can't be blank"}
    validates :arrival_date, presence: true, numericality: { other_than: 1 , message: "Arrival_date can't be blank"}
    validates :price, presence: true

    def self.search(search)
        if search!=""
          Item.where('text LIKE(?)', "%#{search}%")
        else
          Item.all
        end
      end
end
