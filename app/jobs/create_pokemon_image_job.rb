# frozen_string_literal: true

class CreatePokemonImageJob < ApplicationJob
  queue_as :default
  require 'open-uri'

  def perform(pokemon, uri, gender, is_shiny)
    file = open_image(uri)
    return unless file

    create_pokemon_skin(pokemon, file, gender, is_shiny)
  end

  def create_pokemon_skin(pokemon, file, gender, is_shiny)
    skin = PokemonSkin.create(
      pokemon_id: pokemon.id,
      gender: gender,
      shiny: is_shiny
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
