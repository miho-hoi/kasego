class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.date        :date,          null: false
      t.integer     :times,         null: false
      t.references  :to_do,         null: false, foreign_key: true
      t.references  :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
