# frozen_string_literal: true

module Mutations
  class CreateResearchTask < BaseMutation
    argument :description, String, required: true
    argument :kind, Types::ResearchTaskKind, required: true
    argument :research_step_id, ID, required: false

    type Types::ResearchTaskType

    def resolve(description: nil, kind: nil, research_step_id: nil)
      ResearchTask.create!(
        description: description,
        kind: kind,
        research_step_id: research_step_id
      )
    end

    def self.authorized?(object, context)
      super && context[:current_user]&.can_manage?(name)
    end
  end
end
