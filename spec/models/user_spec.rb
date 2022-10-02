require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do

    it 'nicknameが空では登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したメールアドレスは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailに@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it '英字のみのパスワードは登録できない' do
      @user.password = "/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には6文字以上の英字と数字の両方を含めて設定してください")
    end

    it '数字のみのパスワードは登録できない' do
      @user.password = "/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には6文字以上の英字と数字の両方を含めて設定してください")
    end

    it '全角文字を含むパスワードは登録できない' do
      @user.password = "/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には6文字以上の英字と数字の両方を含めて設定してください")
    end

    it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には6文字以上の英字と数字の両方を含めて設定してください")
    end

    it '名前が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '名前（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = "aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字（漢字・ひらがな・カタカナ）を使用してください")
    end

    it '姓が空では登録できない' do
      @user.last_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字（漢字・ひらがな・カタカナ）を使用してください")
    end

    it '名前カナが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_name_kana = "ああ嗚呼aa@@"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角文字（カタカナ）を使用してください")
    end

    it '名前（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name_kana = "ああ嗚呼aa@@"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角文字（カタカナ）を使用してください")
    end

    it '生年月日が空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
