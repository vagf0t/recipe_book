# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20220308160444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_authors_on_name", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "cuisines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_cuisines_on_name", unique: true, using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "recipe_id",   null: false
    t.index ["description"], name: "index_ingredients_on_description", using: :btree
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id", using: :btree
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.integer  "prep_time"
    t.integer  "cook_time"
    t.string   "image"
    t.decimal  "ratings"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "author_id",   null: false
    t.integer  "cuisine_id"
    t.integer  "category_id"
    t.index ["author_id"], name: "index_recipes_on_author_id", using: :btree
    t.index ["category_id"], name: "index_recipes_on_category_id", using: :btree
    t.index ["cook_time"], name: "index_recipes_on_cook_time", using: :btree
    t.index ["cuisine_id"], name: "index_recipes_on_cuisine_id", using: :btree
    t.index ["prep_time"], name: "index_recipes_on_prep_time", using: :btree
    t.index ["ratings"], name: "index_recipes_on_ratings", using: :btree
    t.index ["title"], name: "index_recipes_on_title", using: :btree
  end

  add_foreign_key "ingredients", "recipes"
  add_foreign_key "recipes", "authors"
  add_foreign_key "recipes", "categories"
  add_foreign_key "recipes", "cuisines"
end
