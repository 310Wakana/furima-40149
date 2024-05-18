class Record < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_many_attached :images

  validates :record, presence: true
end
