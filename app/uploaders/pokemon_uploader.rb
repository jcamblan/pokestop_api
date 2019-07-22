# frozen_string_literal: true

class PokemonUploader < Shrine
  def generate_location(_, _)
    folder = 'pokemons'
    name = super
    [folder, name].compact.join('/')
  end
end
