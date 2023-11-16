class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.date        :date,        null: false
      t.integer     :total_price, null: false
      t.references  :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
