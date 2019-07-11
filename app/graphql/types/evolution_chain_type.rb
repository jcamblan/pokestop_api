module Types
  class EvolutionChainType < Types::BaseObject
    field :chain, [String], null: false

    def chain
      [1, 2, 3]
    end
  end
end
