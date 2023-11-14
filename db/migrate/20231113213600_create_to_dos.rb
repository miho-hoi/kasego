class CreateToDos < ActiveRecord::Migration[7.0]
  def change
    create_table :to_dos do |t|
      t.string :content,   null: false
      t.integer :price,    null: false
      t.timestamps
    end
  end
end
