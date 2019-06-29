# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_627_205_906) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'candies', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'egg_translations', force: :cascade do |t|
    t.integer 'egg_id', null: false
    t.string 'locale', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.text 'description'
    t.index ['egg_id'], name: 'index_egg_translations_on_egg_id'
    t.index ['locale'], name: 'index_egg_translations_on_locale'
  end

  create_table 'eggs', force: :cascade do |t|
    t.boolean 'available'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'eggs_pokemons', force: :cascade do |t|
    t.integer 'egg_id'
    t.integer 'pokemon_id'
  end

  create_table 'evolutions', force: :cascade do |t|
    t.integer 'first_pokemon_id', null: false
    t.integer 'from_pokemon_id', null: false
    t.integer 'to_pokemon_id', null: false
    t.integer 'reference_pokemon_id', null: false
    t.integer 'required_candies_count', null: false
    t.integer 'required_item_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'generation_translations', force: :cascade do |t|
    t.integer 'generation_id', null: false
    t.string 'locale', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.index ['generation_id'], name: 'index_generation_translations_on_generation_id'
    t.index ['locale'], name: 'index_generation_translations_on_locale'
  end

  create_table 'generations', force: :cascade do |t|
    t.integer 'uid'
    t.boolean 'available'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'items', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'move_translations', force: :cascade do |t|
    t.integer 'move_id', null: false
    t.string 'locale', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.text 'description'
    t.index ['locale'], name: 'index_move_translations_on_locale'
    t.index ['move_id'], name: 'index_move_translations_on_move_id'
  end

  create_table 'moves', force: :cascade do |t|
    t.string 'kind'
    t.integer 'type_id'
    t.decimal 'power'
    t.decimal 'epu'
    t.decimal 'cast_time'
    t.integer 'energy_bars'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'movesets', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'pokemon_translations', force: :cascade do |t|
    t.integer 'pokemon_id', null: false
    t.string 'locale', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.text 'description'
    t.index ['locale'], name: 'index_pokemon_translations_on_locale'
    t.index ['pokemon_id'], name: 'index_pokemon_translations_on_pokemon_id'
  end

  create_table 'pokemons', force: :cascade do |t|
    t.string 'nid', null: false
    t.bigint 'generation_id', null: false
    t.integer 'candy_id'
    t.integer 'candy_distance'
    t.string 'kind', default: 'normal'
    t.text 'pokedex_entry'
    t.text 'comment'
    t.decimal 'flee_rate'
    t.decimal 'capture_rate'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'research_steps', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'research_tasks', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'research_translations', force: :cascade do |t|
    t.integer 'research_id', null: false
    t.string 'locale', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.text 'description'
    t.index ['locale'], name: 'index_research_translations_on_locale'
    t.index ['research_id'], name: 'index_research_translations_on_research_id'
  end

  create_table 'researches', force: :cascade do |t|
    t.boolean 'available', default: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'rewards', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'skins', force: :cascade do |t|
    t.integer 'pokemon_id', null: false
    t.string 'gender', null: false
    t.string 'kind', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'types', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
