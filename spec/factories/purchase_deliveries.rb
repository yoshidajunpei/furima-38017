FactoryBot.define do
  factory :purchase_delivery do
    postal_code         {111-1111}
    prefecture_id       {2}
    municipality        {"北海道"}
    address             {"旭川市"}
    phone_number        {'08011111111'}
    token               {"tok_abcdefghijk00000000000000000"}
    
  end
end



