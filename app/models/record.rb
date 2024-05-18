class Record < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_many_attached :images
  belongs_to :delivery_charges
  

  validates :record, presence: true
end
