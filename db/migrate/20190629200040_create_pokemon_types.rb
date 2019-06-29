class CreatePokemonTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_types do |t|
      t.bigint :pokemon_id
      t.bigint :type_id
    end
  end
end
