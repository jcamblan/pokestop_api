# frozen_string_literal: true

# == Schema Information
#
# Table name: research_steps
#
#  id          :bigint           not null, primary key
#  research_id :bigint           not null
#  step_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ResearchStepTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
