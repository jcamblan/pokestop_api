# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :all_generations, [Types::GenerationType], null: false

    field :all_pokemons, [Types::PokemonType], null: false do
      argument :kind, String, required: false
      argument :generation_id, ID, required: false
      argument :limit, Int, required: false
      argument :skip, Int, required: false
      argument :order, String, required: false
      argument :type_id, ID, required: false
      argument :generation_id, ID, required: false
    end

    field :all_researches, [Types::ResearchType], null: false do
      argument :available, Boolean, required: false
    end

    field :all_eggs, [Types::EggType], null: false

    field :all_evolutions_chains, [Types::EvolutionChainType], null: false

    field :all_raids, [Types::RaidType], null: false

    field :generation, GenerationType, null: false do
      argument :generation_id, ID, required: true, as: :id
    end

    field :pokemon, PokemonType, null: false do
      argument :pokemon_nid, ID, required: true, as: :nid
    end

    field :research, ResearchType, null: false do
      argument :research_id, ID, required: true, as: :id
    end

    field :egg, EggType, null: false do
      argument :egg_id, ID, required: true, as: :id
    end

    field :evolution_chain, EvolutionChainType, null: true do
      argument :pokemon_id, ID, required: true, as: :from_pokemon_id
    end

    field :raid, RaidType, null: false do
      argument :raid_id, ID, required: true, as: :id
    end

    def all_generations
      Generation.all
    end

    def generation(id:)
      Generation.find(id)
    end

    def all_pokemons(**args)
      # TODO: refactor this shit. Maybe with Resolver?
      scope = Pokemon
      scope = scope.joins(:types).where(types: { id: args[:type_id] }) if args[:type_id]
      scope = scope.all unless args.any?
      scope = scope.where(kind: args[:kind]) if args[:kind]
      scope = scope.where(generation_id: args[:generation_id]) if args[:generation_id]
      order = args[:order] || :nid
      scope = scope.order(order)
      scope = scope.limit(args[:limit]) if args[:limit]
      scope = scope.offset(args[:skip]) if args[:skip]
      scope
    end

    def pokemon(nid:)
      Pokemon.find_by(nid: nid)
    end

    def all_researches(**args)
      if args
        Research.where(args)
      else
        Research.all
      end
    end

    def research(id:)
      Research.find(id)
    end

    def all_eggs
      Egg.all
    end

    def egg(id:)
      Egg.find(id)
    end

    def all_evolutions_chains
      Evolution.all.select { |e| e.first_pokemon_id == e.from_pokemon_id }
    end

    def evolution_chain(from_pokemon_id:)
      Evolution.find_by(from_pokemon_id: from_pokemon_id)
    end

    def all_raids
      Raid.all
    end

    def raid(id:)
      Raid.find(id)
    end
  end
end
