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

ActiveRecord::Schema.define(version: 20171220145736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "neighborhood"
    t.string "city"
    t.string "number"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_addresses_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools_teachers", id: false, force: :cascade do |t|
    t.bigint "school_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["school_id", "teacher_id"], name: "index_schools_teachers_on_school_id_and_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "instruct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
