# frozen_string_literal: true

class Types::ResearchRewardUnion < GraphQL::Schema::Union
  description 'possible researches rewards'
  possible_types Types::ItemType,
                 Types::PokemonType,
                 Types::CandyType,
                 Types::XpType

  def self.resolve_type(object, _context)
    "::Types::#{object.class}Type".safe_constantize
  end
end
