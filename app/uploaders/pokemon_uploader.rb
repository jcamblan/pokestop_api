# frozen_string_literal: true

class PokemonUploader < Shrine
  def generate_location(io, context = {})
    folder = 'pokemons'
    name = super
    [folder, name].compact.join('/')
  end

  # def extract_metadata(io, context = {})
  #   {
  #     filename: pokemon_filename(context) || extract_filename(io),
  #     size: extract_size(io),
  #     mime_type: extract_mime_type(io)
  #   }
  # end

  private

  def pokemon_filename(context)
    skin = context.dig(:record)
    pokemon = skin&.pokemon
    return unless pokemon

    shiny = skin.shiny ? 'shiny' : nil

    ['pokemon', pokemon.nid, skin.gender, skin.kind, shiny].compact.join('_')
  end

  # Attempts to extract the appropriate filename from the IO object.
  def extract_filename(io)
    super
  end

  # Attempts to extract the MIME type from the IO object.
  def extract_mime_type(io)
    super
  end

  # Extracts the filesize from the IO object.
  def extract_size(io)
    super
  end
end
