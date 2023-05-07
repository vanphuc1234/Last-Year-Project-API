# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_05_07_074743) do

  create_table "product_images", force: :cascade do |t|
    t.integer "product_id"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "business_type"
    t.string "category_type"
    t.float "price"
    t.float "area"
    t.string "direction"
    t.integer "beds_count"
    t.integer "baths_count"
    t.string "city"
    t.string "district"
    t.string "ward"
    t.string "street"
    t.integer "facade"
    t.integer "floor_count"
    t.string "image_url"
    t.integer "images_count"
    t.float "lat"
    t.float "lon"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "saves", force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_saves_on_product_id"
    t.index ["user_id"], name: "index_saves_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "avatar_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "password"
    t.string "api_token"
    t.string "job_title"
    t.string "phone"
    t.string "sex"
    t.string "experience_year"
    t.string "description"
    t.string "address"
    t.string "type_user"
    t.string "avatar"
    t.index ["api_token"], name: "index_users_on_api_token"
    t.index ["username", "password"], name: "index_users_on_username_and_password"
  end

end
