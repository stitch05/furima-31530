FactoryBot.define do
  factory :purchase_form do
    address            { "あああ" }
    post_code          { "000-0000" }
    city               { "あああ" }
    phone_number       { "00000000000" }
    shipping_area_id   { 2 }
    token              { "aaa" }
    building_name      { "あああ" }
  end
end
