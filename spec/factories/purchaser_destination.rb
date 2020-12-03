FactoryBot.define do
  factory :purchaser_destination do
    postal { "123-4567" }
    prefecture_id { 3 }
    municipalities { "姫路市" }
    address { "12-2" }
    building { "マンション" }
    telephone_number { "09012345678" }
    token { "tok_abcdefghijk00000000000000000" }
  end
end