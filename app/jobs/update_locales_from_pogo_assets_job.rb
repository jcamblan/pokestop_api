# frozen_string_literal: true

class UpdateLocalesFromPogoAssetsJob < ApplicationJob
  queue_as :default

  def perform
    @locales = %i[fr en]
    @datas = PogoAssetsUtils.updated_datas(@locales)
    @pokemon_ids = Pokemon.all.pluck(:pkgo_id, :id)

    translate
  end

  def translate
    @pokemon_ids.each do |p|
      @locales.each do |locale|
        next unless @datas.dig(locale, "pokemon_name_#{p[0]}")

        translation = Pokemon::Translation.find_or_initialize_by(
          pokemon_id: p[1],
          locale: locale
        )
        translation.assign_attributes(
          pokemon_id: p[1],
          locale: locale,
          name: @datas.dig(locale, "pokemon_name_#{p[0]}"),
          description: @datas.dig(locale, "pokemon_desc_#{p[0]}"),
          category: @datas.dig(locale, "pokemon_category_#{p[0]}")
        )
        translation.save
      end
    end
  end
end
