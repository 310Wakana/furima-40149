class Address < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :record


end