class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :description

      t.index :description
      t.timestamps
    end
    add_reference :ingredients, :recipe, foreign_key: true, null: false
  end
end
