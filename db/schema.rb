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

ActiveRecord::Schema.define(:version => 20130820005655) do

  create_table "article_pictures", :force => true do |t|
    t.integer  "article_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "internal_article"
    t.text     "full_body"
    t.string   "link"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "author"
  end

  create_table "sound_clips", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "wav_file_name"
    t.string   "wav_content_type"
    t.integer  "wav_file_size"
    t.datetime "wav_updated_at"
    t.string   "slug"
  end

  create_table "videos", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "mp4_file_name"
    t.string   "mp4_content_type"
    t.integer  "mp4_file_size"
    t.datetime "mp4_updated_at"
    t.string   "ogg_file_name"
    t.string   "ogg_content_type"
    t.integer  "ogg_file_size"
    t.datetime "ogg_updated_at"
    t.string   "slug"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
  end

  create_table "zones", :force => true do |t|
    t.integer  "video_id"
    t.integer  "sound_clip_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "rank"
  end

end
