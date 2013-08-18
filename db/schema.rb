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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130818151253) do

  create_table "discussions", :force => true do |t|
    t.integer  "messages_count",   :default => 0
    t.integer  "discussable_id"
    t.string   "discussable_type"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "meta_reports", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "profile_id"
  end

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.boolean  "public"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "profile_id"
    t.text     "description"
    t.integer  "testsuly"
    t.integer  "testzsir"
    t.date     "keszult"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.integer  "magassag"
    t.integer  "nem"
    t.string   "gym"
    t.string   "varos"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "nem2"
    t.integer  "date_of_birth"
    t.string   "image"
    t.text     "description"
    t.text     "motivation"
    t.string   "real_name"
    t.string   "sport"
    t.string   "user_name"
    t.text     "gym_routine"
    t.text     "nutrition"
    t.boolean  "private"
    t.string   "slug"
    t.string   "cover_image"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "sizes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "nyak"
    t.integer  "vall"
    t.integer  "mell"
    t.integer  "kar"
    t.integer  "alkar"
    t.integer  "derek"
    t.integer  "csipo"
    t.integer  "comb"
    t.integer  "vadli"
    t.integer  "testsuly"
    t.integer  "testzsir"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "mikor"
    t.integer  "profile_id"
  end

  create_table "speakers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "admin"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "uname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "name"
    t.string   "v"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "workouts", :force => true do |t|
    t.string   "name"
    t.integer  "difficulty"
    t.text     "description"
    t.datetime "mikor"
    t.integer  "user_id"
    t.boolean  "template"
    t.date     "mikor_date"
    t.integer  "period_time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "color"
    t.integer  "profile_id"
    t.string   "slug"
  end

end
