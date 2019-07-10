module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :description, String, null: true
    field :kind, String, null: false
  end
end
