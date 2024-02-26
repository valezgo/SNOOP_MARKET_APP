class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.float :price
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
