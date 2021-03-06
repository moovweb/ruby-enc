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

ActiveRecord::Schema.define(version: 20160503213802) do

  create_table "metrics", force: :cascade do |t|
    t.integer  "report_id",  limit: 4,                            null: false
    t.string   "category",   limit: 255
    t.string   "name",       limit: 255
    t.decimal  "value",                  precision: 12, scale: 6
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "metrics", ["report_id"], name: "index_metrics_on_report_id", using: :btree

  create_table "node_class_memberships", force: :cascade do |t|
    t.integer  "node_id",       limit: 4
    t.integer  "node_class_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "node_classes", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "node_classes", ["name"], name: "index_node_classes_on_name", unique: true, using: :btree

  create_table "node_group_memberships", force: :cascade do |t|
    t.integer  "node_id",       limit: 4
    t.integer  "node_group_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "node_group_memberships", ["node_group_id"], name: "index_node_group_memberships_on_node_group_id", using: :btree

  create_table "node_groups", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "node_groups", ["name"], name: "index_node_groups_on_name", unique: true, using: :btree

  create_table "nodes", force: :cascade do |t|
    t.string   "name",                   limit: 255,                   null: false
    t.text     "description",            limit: 65535
    t.datetime "reported_at"
    t.integer  "last_apply_report_id",   limit: 4
    t.string   "status",                 limit: 255
    t.boolean  "hidden",                               default: false
    t.integer  "last_inspect_report_id", limit: 4
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "environment",            limit: 255
  end

  add_index "nodes", ["name"], name: "index_nodes_on_name", unique: true, using: :btree

  create_table "parameters", force: :cascade do |t|
    t.string   "key",                limit: 255
    t.text     "value",              limit: 65535
    t.integer  "parameterable_id",   limit: 4
    t.string   "parameterable_type", limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "report_logs", force: :cascade do |t|
    t.integer  "report_id",  limit: 4
    t.string   "level",      limit: 255
    t.text     "message",    limit: 65535
    t.datetime "time"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "source",     limit: 255
  end

  add_index "report_logs", ["report_id"], name: "index_report_logs_on_report_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "node_id",     limit: 4
    t.string   "status",      limit: 255
    t.string   "environment", limit: 255
    t.datetime "time"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "reports", ["node_id"], name: "index_reports_on_node_id", using: :btree

  create_table "resource_statuses", force: :cascade do |t|
    t.integer  "report_id",  limit: 4
    t.boolean  "failed"
    t.boolean  "skipped"
    t.boolean  "is_changed"
    t.text     "title",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "resource_statuses", ["report_id"], name: "index_resource_statuses_on_report_id", using: :btree

end
