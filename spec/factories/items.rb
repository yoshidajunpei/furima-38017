FactoryBot.define do
  factory :item do
    name                   {Faker::Name}
    description            {"商品説明文"}
    category_id            {2}
    status_id              {2}
    price                  {Faker::Number.between(from: 300, to:9999999 )}
    delivery_cost_id       {2}
    prefecture_id          {2}
    delivery_date_id       {2}
    
    #画像とユーザーのアソシエーション
    association :user

    #画像添付
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  
  
  end
end
