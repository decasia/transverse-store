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

ActiveRecord::Schema.define(version: 20161116225257) do

  create_table "authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "group_id"
    t.index ["group_id"], name: "index_authors_on_group_id", using: :btree
  end

  create_table "docs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "content",    limit: 65535
    t.integer  "work_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "group_id"
    t.index ["group_id"], name: "index_docs_on_group_id", using: :btree
    t.index ["work_id"], name: "index_docs_on_work_id", using: :btree
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",           limit: 65535
    t.string   "oauth_consumer_secret"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "oauth_consumer_key"
    t.index ["oauth_consumer_key"], name: "index_groups_on_oauth_consumer_key", using: :btree
  end

  create_table "groups_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.index ["group_id"], name: "index_groups_users_on_group_id", using: :btree
    t.index ["user_id"], name: "index_groups_users_on_user_id", using: :btree
  end

  create_table "notes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "source",     limit: 65535
    t.text     "content",    limit: 65535
    t.integer  "author_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "group_id"
    t.index ["author_id"], name: "index_notes_on_author_id", using: :btree
    t.index ["group_id"], name: "index_notes_on_group_id", using: :btree
  end

  create_table "terms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "example",    limit: 65535
    t.text     "definition", limit: 65535
    t.text     "discussion", limit: 65535
    t.integer  "author_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "group_id"
    t.index ["author_id"], name: "index_terms_on_author_id", using: :btree
    t.index ["group_id"], name: "index_terms_on_group_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_admin",         default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "current_group_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "lms_role"
  end

  create_table "works", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.integer  "author_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "group_id"
    t.index ["author_id"], name: "index_works_on_author_id", using: :btree
    t.index ["group_id"], name: "index_works_on_group_id", using: :btree
  end

end
