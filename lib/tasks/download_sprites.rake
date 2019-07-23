# frozen_string_literal: true

namespace :download_sprites do
  desc 'Get Pokémons images from PogoAssets github'
  task pokemons: :environment do
    Pokemon.find_each do |pokemon|
      2.times do |g|
        2.times do |s|
          is_shiny = s == 1
          gender = g.zero? ? :neutral : :female
          shiny = is_shiny ? '_shiny' : ''
          image = "pokemon_icon_#{pokemon.nid}_0#{g}#{shiny}.png"
          uri = URI::HTTPS.build(
            host: 'raw.githubusercontent.com',
            path: "/ZeChrales/PogoAssets/master/pokemon_icons/#{image}"
          )
          CreatePokemonImageJob.perform_later(pokemon, uri, gender, is_shiny)
        end
      end
    end
  end
end
