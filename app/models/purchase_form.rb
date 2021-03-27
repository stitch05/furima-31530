class PurchaseForm
  include ActiveModel::Model
  attr_accessor :post_code, :city, :address, :building_name, :phone_number, :item_id, :user_id, :shipping_area_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
  end
  validate :building_name
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank"  } do
    validates :shipping_area_id
  end
    def save
      purchase = Purchase.create(item_id: item_id, user_id: user_id)
      Shipping.create(post_code: post_code, address: address, shipping_area_id: shipping_area_id, city: city, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)

    end
end