FactoryBot.define do
  factory :purchase_form do
    address            { "あああ" }
    post_code          { "000-0000" }
    prefecture_id      { 2 }
    city               { "あああ" }
    phone_number       { "00000000000" }
    shipping_area_id   { 2 }
    token              { "aaa" }
  end
end
