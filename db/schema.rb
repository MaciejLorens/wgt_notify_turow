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

ActiveRecord::Schema.define(version: 2018_12_05_190355) do

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "postcode", null: false
    t.string "city", null: false
    t.string "country", null: false
    t.string "email", null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "hidden_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hidden"], name: "index_companies_on_hidden"
  end

  create_table "drivers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "hidden_at"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_drivers_on_company_id"
    t.index ["hidden"], name: "index_drivers_on_hidden"
  end

  create_table "invitations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "token"
    t.integer "company_id"
    t.string "role"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_invitations_on_company_id"
    t.index ["email"], name: "index_invitations_on_email"
    t.index ["role"], name: "index_invitations_on_role"
    t.index ["token"], name: "index_invitations_on_token"
  end

  create_table "notifies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "pin", null: false
    t.string "number", null: false
    t.string "car_number", null: false
    t.string "semitrailer_number", null: false
    t.datetime "expiration_from", null: false
    t.datetime "expiration_to", null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "hidden_at"
    t.integer "product_id", null: false
    t.integer "driver_id", null: false
    t.integer "user_id", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_notifies_on_company_id"
    t.index ["created_at"], name: "index_notifies_on_created_at"
    t.index ["driver_id"], name: "index_notifies_on_driver_id"
    t.index ["hidden"], name: "index_notifies_on_hidden"
    t.index ["product_id"], name: "index_notifies_on_product_id"
    t.index ["user_id"], name: "index_notifies_on_user_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "number", null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "hidden_at"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["hidden"], name: "index_products_on_hidden"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "hidden_at"
    t.string "role", default: "client", null: false
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
