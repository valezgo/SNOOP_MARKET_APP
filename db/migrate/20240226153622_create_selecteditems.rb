class CreateSelecteditems < ActiveRecord::Migration[7.1]
  def change
    create_table :selecteditems do |t|
      t.integer :quantity
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
