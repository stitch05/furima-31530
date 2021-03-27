class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :trading_status
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image
  has_one :purchase


  with_options presence: true do
    validates :name
    validates :price
    validates :description
    validates :image
  end
  
  validates_numericality_of :price, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id 
    validates :delivery_fee_id
    validates :trading_status_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
end

