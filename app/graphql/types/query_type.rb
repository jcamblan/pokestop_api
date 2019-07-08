# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :generations,
          [Types::GenerationType],
          null: false,
          description: 'Returns generations list'

    field :all_pokemons, [Types::PokemonType], null: false do
      argument :kind, String, required: false
      argument :generation_id, ID, required: false
      argument :limit, Int, required: false
      argument :skip, Int, required: false
      argument :order, String, required: false
      argument :type_id, ID, required: false
    end

    field :pokemon, PokemonType, null: false, description: 'show pokemon' do
      argument :pokemon_id, ID, required: true, as: :id
    end

    field :researches, [Types::ResearchType], null: false do
      argument :available, Boolean, required: false
    end
    field :research, ResearchType, null: false do
      argument :research_id, ID, required: true, as: :id
    end

    def generations
      Generation.all
    end

    def all_pokemons(**args)
      # TODO: refactor this shit. Maybe with Resolver?
      scope = Pokemon
      scope = scope.joins(:types).where(types: { id: args[:type_id] }) if args[:type_id]
      scope = scope.all unless args.any?
      scope = scope.where(kind: args[:kind]) if args[:kind]
      order = args[:order] || :nid
      scope = scope.order(order)
      scope = scope.limit(args[:limit]) if args[:limit]
      scope = scope.offset(args[:skip]) if args[:skip]
      scope
    end

    def pokemon(id:)
      Pokemon.find(id)
    end

    def research(id:)
      Research.find(id)
    end

    def researches(**args)
      if args
        Research.where(args)
      else
        Research.all
      end
    end
  end
end
