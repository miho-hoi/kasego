require 'rails_helper'

RSpec.describe Payment, type: :model do
  before do
    @payment = FactoryBot.build(:payment)
  end

  describe 'の登録' do
    context 'もらった金額の登録ができる場合' do
      it '全ての項目が入力されている' do
        expect(@payment).to be_valid
      end
    end

    context 'もらった金額の登録ができない場合' do
      it '日付が入力されていない' do
        @payment.date = nil
        @payment.valid?
        expect(@payment.errors.full_messages).to include('日付を入力してください')
      end

      it '合計金額が入力されていない' do
        @payment.total_price = nil
        @payment.valid?
        expect(@payment.errors.full_messages).to include('先月の合計金額を入力してください')
      end

      it 'ユーザーが紐づいていない' do
        @payment.user = nil
        @payment.valid?
        expect(@payment.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
