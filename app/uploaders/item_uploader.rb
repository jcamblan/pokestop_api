# frozen_string_literal: true

class ItemUploader < Shrine
  def generate_location(_, _)
    folder = 'items'
    name = super
    [folder, name].compact.join('/')
  end
end
