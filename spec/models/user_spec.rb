require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
    user = User.new(nick_name: '', email: 'test@example', password: '000000', password_confirmation: '000000',first_name: '山田',last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '00000000')
    user.valid?
    expect(user.errors.full_messages).to include("Nick name can't be blank")
    end

    it 'emailが空では登録できない' do
      user = User.new(nick_name: 'もも', email: '', password: '000000', password_confirmation: '000000',first_name: '山田',last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
      end

    it 'passwordが空では登録できない' do
      user = User.new(nick_name: 'もも', email: 'test@example', password: '', password_confirmation: '000000',first_name: '山田',last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it '名前が空では登録できない' do
      user = User.new(nick_name: 'もも', email: 'test@example', password: '000000', password_confirmation: '000000',first_name: '',last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it '苗字が空では登録できない' do
      user = User.new(nick_name: 'もも', email: 'test@example', password: '000000', password_confirmation: '000000',first_name: '山田',last_name: '', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it '名前カナが空では登録できない' do
      user = User.new(nick_name: 'もも', email: 'test@example', password: '000000', password_confirmation: '000000',first_name: '山田',last_name: '太郎', first_name_kana: '', last_name_kana: 'タロウ', birth: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '苗字カナが空では登録できない' do
      user = User.new(nick_name: 'もも', email: 'test@example', password: '000000', password_confirmation: '000000',first_name: '山田',last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: '', birth: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it '生年月日が空では登録できない' do
      user = User.new(nick_name: 'もも', email: 'test@example', password: '000000', password_confirmation: '000000',first_name: '山田',last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
