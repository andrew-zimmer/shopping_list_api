class CreateListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :list_items do |t|
      t.references :list, null: false, foreign_key: true
      t.string :item
      t.boolean :checked

      t.timestamps
    end
  end
end
