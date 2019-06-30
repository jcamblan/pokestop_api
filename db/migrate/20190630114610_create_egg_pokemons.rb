class CreateEggPokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :egg_pokemons do |t|
      t.bigint :pokemon_id
      t.bigint :egg_id
      t.timestamps
    end
  end
end
