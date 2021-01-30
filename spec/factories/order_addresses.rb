FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { '3' }
    city { '青山1丁目' }
    block_number { '31-2' }
    building_name { '青山ビル' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    item_id {'1'}
    user_id {'1'}
  end
end
