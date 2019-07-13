# frozen_string_literal: true

# == Schema Information
#
# Table name: research_tasks
#
#  id               :bigint           not null, primary key
#  research_step_id :bigint
#  kind             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ResearchTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
