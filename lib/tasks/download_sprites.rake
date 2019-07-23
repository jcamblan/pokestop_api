# frozen_string_literal: true

namespace :download_sprites do
  desc 'Get Pokémons images from PogoAssets github'
  task pokemons: :environment do
    json = JSON.parse(
      File.read(File.join(Rails.root, 'public', 'pokemons_images_list.json'))
    )
    images_names = json.dig('images')

    images_formatted = format_images(images_names)

    Pokemon.find_each do |pokemon|
      next unless images_formatted.dig(pokemon.nid)

      images_formatted.dig(pokemon.nid).each do |image|
        filename = image.keys.first
        value = image.values.first
        next unless (pokemon.kind == :alolan) == value[:alolan]

        uri = URI::HTTPS.build(
          host: 'raw.githubusercontent.com',
          path: "/ZeChrales/PogoAssets/master/pokemon_icons/#{filename}"
        ).to_s

        CreatePokemonImageJob.perform_later(
          pokemon,
          uri,
          value[:gender],
          value[:shiny],
          value[:alolan],
          value[:kind]
        )
      end
    end
  end

  def format_images(images_names)
    first_step = images_names.map do |i|
      hash = {}
      hash[i] = i.chomp('.png').split('_') - %w[pokemon icon]
      hash
    end

    second_step = first_step.map do |i|
      hash = {}
      v = i.values.first
      next if v.count < 2

      value = if v.count == 2 && v[1].match?('61')
                {
                  nid: v[0],
                  gender: :neutral,
                  kind: :normal,
                  alolan: true,
                  shiny: false
                }
              elsif v.count == 2
                {
                  nid: v[0],
                  gender: v[1].match?('01') ? :female : :neutral,
                  kind: :normal,
                  alolan: false,
                  shiny: false
                }
              elsif v.count == 3 && v[-1].match?('shiny') && v[1].match?('61')
                {
                  nid: v[0],
                  gender: :neutral,
                  kind: :normal,
                  alolan: true,
                  shiny: true
                }
              elsif v.count == 3 && v[-1].match?('shiny')
                {
                  nid: v[0],
                  gender: v[1].match?('01') ? :female : :neutral,
                  kind: :normal,
                  alolan: false,
                  shiny: true
                }
              elsif v.count == 3 && v[1].match?('61')
                {
                  nid: v[0],
                  gender: :neutral,
                  kind: :special,
                  alolan: true,
                  shiny: false
                }
              elsif v.count == 3
                {
                  nid: v[0],
                  gender: v[1].match?('01') ? :female : :neutral,
                  kind: :special,
                  alolan: false,
                  shiny: false
                }
              elsif v.count == 4 && v[0].match?('pm0150')
                {
                  nid: '150',
                  gender: :neutral,
                  kind: :special,
                  alolan: false,
                  shiny: false
                }
              elsif v.count == 4 && v[1].match?('61')
                {
                  nid: v[0],
                  gender: :neutral,
                  kind: :special,
                  alolan: true,
                  shiny: true
                }
              elsif v.count == 4
                {
                  nid: v[0],
                  gender: v[1].match?('01') ? :female : :neutral,
                  kind: :special,
                  alolan: false,
                  shiny: true
                }
              elsif v.count == 5
                {
                  nid: '150',
                  gender: :neutral,
                  kind: :special,
                  alolan: false,
                  shiny: true
                }
              end
      hash[i.keys.first] = value
      hash
    end.compact

    second_step.group_by { |i| i.values.first[:nid] }
  end
end
