FactoryBot.define do
  factory :item do
    name                { "商品名" }
    price               { 300 }
    description         { "aaa" }
    delivery_fee_id     { 2 }
    trading_status_id   { 2 }
    shipping_area_id    { 2 }
    shipping_day_id    { 2 }
    category_id        { 2 }
    association :user
  end
end
