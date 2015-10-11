# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151010081103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "account_name"
    t.decimal  "real_balance"
    t.decimal  "calc_balance",    default: 0.0
    t.integer  "user_id"
    t.string   "meta"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "item"
    t.string   "account_type"
    t.string   "sub_type"
    t.string   "bank_account_id"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.string   "description"
    t.decimal  "amount"
    t.date     "date"
    t.integer  "account_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "transactions", ["account_id"], name: "index_transactions_on_account_id", using: :btree
  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "bank"
    t.string   "bank_password"
    t.string   "bank_user_name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "token_id"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "users"
end
