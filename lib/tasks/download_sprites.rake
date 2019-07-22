# frozen_string_literal: true

require 'open-uri'

# TODO: move skin creation/upload into jobs before use
namespace :download_sprites do
  desc 'Get Pokémons images from PogoAssets github'
  task pokemons: :environment do
    Pokemon.find_each do |pokemon|
      2.times do |g|
        2.times do |s|
          shiny = s == 1 ? '_shiny' : ''
          image = "pokemon_icon_#{pokemon.nid}_0#{g}#{shiny}.png"
          uri = URI::HTTPS.build(
            host: 'raw.githubusercontent.com',
            path: "/ZeChrales/PogoAssets/master/pokemon_icons/#{image}"
          )
          file = open_image(uri)
          next unless file

          create_pokemon_skin(pokemon, file, g, s)
        end
      end
    end
  end

  def create_pokemon_skin(pokemon, file, gender, shiny)
    skin = PokemonSkin.create(
      pokemon_id: pokemon.id,
      gender: gender.zero? ? :neutral : :female,
      shiny: shiny == 1
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
