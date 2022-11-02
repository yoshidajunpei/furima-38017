class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many   :items
  has_many   :purchases
  has_one    :card, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :birth, presence: true
  validates :nick_name, presence: true
  # validates :password, confirmation: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字（漢字・ひらがな・カタカナ）を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角文字（カタカナ）を使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

   PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
   validates_format_of :password, with: PASSWORD_REGEX, message: 'には6文字以上の英字と数字の両方を含めて設定してください', on: :create
   #on create：createアクション時のみ発動する
end
