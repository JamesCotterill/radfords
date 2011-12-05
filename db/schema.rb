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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111205211913) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.date     "takes_place_on"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "address"
    t.string   "name"
    t.string   "telephone_number"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "lat",              :precision => 15, :scale => 10
    t.decimal  "lng",              :precision => 15, :scale => 10
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

end
