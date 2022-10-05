class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to   :user
  has_one_attached :image




  
  
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :delivery_date

    #空の投稿を保存できないようにする
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true, inclusion: { in: 300..9999999 }
    #ジャンルの選択が「---」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_date_id, numericality: { other_than: 1 , message: "can't be blank"}

  end



