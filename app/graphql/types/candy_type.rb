module Types
  class CandyType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :primary_color, String, null: true
    field :secondary_color, String, null: true
  end
end
