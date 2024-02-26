class CreatePurchaseditems < ActiveRecord::Migration[7.1]
  def change
    create_table :purchaseditems do |t|
      t.integer :quantity
      t.float :price
      t.references :item, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
