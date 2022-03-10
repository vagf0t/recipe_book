class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :prep_time
      t.integer :cook_time
      t.string :image
      t.decimal :ratings
      t.index :ratings
      t.index :title
      t.index :prep_time
      t.index :cook_time
      t.timestamps
    end
    add_reference :recipes, :author, foreign_key: true, null: false
    add_reference :recipes, :cuisine, foreign_key: true, null: true
    add_reference :recipes, :category, foreign_key: true, null: true
  end
end
