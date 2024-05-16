class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one_attached :image
    belongs_to :category
    belongs_to :state
    belongs_to :delivery_charges
    belongs_to :prefecture
    belongs_to :arrival_date
    
    validates :item, presence: true
    validates :concept, presence: true

    validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
    validates :state_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_charges_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
    validates :arrival_date_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
    validates :price, presence: true


end
