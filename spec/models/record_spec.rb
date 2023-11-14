require 'rails_helper'

RSpec.describe Record, type: :model do
  before do 
    @record = FactoryBot.build(:record)
  end

  describe 'やったことの登録' do
    context 'やったことの登録ができる場合' do
      it '全ての項目が入力されている' do
        expect(@record).to be_valid
      end
    end
    context 'やったことの登録ができない場合' do
      it '日付が入力されていない' do
        @record.date = nil
        @record.valid?
        expect(@record.errors.full_messages).to include('日付を入力してください') 
      end

      it '翌日以降の日付が入力されている' do
        @record.date = Date.today + 1
        @record.valid?
        expect(@record.errors.full_messages).to include('日付は今日以前の日付を選択してください')
      end

      it 'やったことが入力されていない' do
        @record.to_do = nil
        @record.valid?
        expect(@record.errors.full_messages).to include('やったことを入力してください')
      end

      it '回数が入力されていない' do
        @record.times = nil
        @record.valid?
        expect(@record.errors.full_messages).to include('回数を入力してください')
      end

      it 'ユーザーが紐づいていない' do
        @record.user = nil
        @record.valid?
        expect(@record.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
