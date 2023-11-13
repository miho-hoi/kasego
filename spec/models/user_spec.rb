require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it '全ての項目が入力されている' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合'do
      it 'ニックネームが入力されていない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームが入力されていません。')
      end

      it 'メールアドレスが入力されていない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスが入力されていません。')
      end

      it 'メールアドレスに@が含まれていない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは有効でありません。')
      end

      it 'メールアドレスが半角英数字以外で入力されている' do
        @user.email = 'ａａａ＠ａａａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは有効でありません。')
      end

      it 'メールアドレスが重複している' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスは既に使用されています。')
      end

      it 'パスワードが入力されていない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードが入力されていません。')
      end

      it 'パスワードが５文字以下になっている' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上に設定して下さい。')
      end

      it 'パスワードが20文字以上になっている' do
        @user.password ='a'*21
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは20文字以下に設定して下さい。')
      end

      it 'パスワードとパスワード確認が一致していない' do
        @user.password = '123456'
        @user.password_confirmation = '1123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードがパスワードと一致しません。')
      end
    end
  end
end
