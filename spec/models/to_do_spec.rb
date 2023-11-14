require 'rails_helper'

RSpec.describe ToDo, type: :model do
  before do
    @to_do = FactoryBot.build(:to_do)
  end

  describe 'やることの登録' do
    context 'やることの登録ができる場合' do
      it '全ての項目が入力されている' do
        expect(@to_do).to be_valid
      end
    end

    context 'やることの登録ができない場合' do
      it 'やることが入力されていない' do
        @to_do.content = nil
        @to_do.valid?
        expect(@to_do.errors.full_messages).to include('やることを入力してください')
      end

      it 'やることが重複している' do
        @to_do.save
        another_to_do = FactoryBot.build(:to_do, content: @to_do.content)
        another_to_do.valid?
        expect(another_to_do.errors.full_messages).to include('やることはすでに存在します')
      end

      it '金額が入力されていない' do
        @to_do.price = nil
        @to_do.valid?
        expect(@to_do.errors.full_messages).to include('金額を入力してください')
      end
    end
  end
end
