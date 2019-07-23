# frozen_string_literal: true

class CreatePokemonImageJob < ApplicationJob
  queue_as :default
  require 'open-uri'

  def perform(pokemon, uri, gender, is_shiny, is_alolan, kind)
    file = open_image(uri)
    return unless file

    create_pokemon_skin(pokemon, file, gender, is_shiny, is_alolan, kind)
  end

  def create_pokemon_skin(pokemon, file, gender, is_shiny, is_alolan, kind)
    skin = PokemonSkin.create(
      pokemon_id: pokemon.id,
      gender: gender,
      shiny: is_shiny,
      alolan: is_alolan,
      kind: kind
    )

    skin.image = file
    skin.save
  end

  def open_image(uri)
    open(uri)
  rescue OpenURI::HTTPError
    nil
  end
end
