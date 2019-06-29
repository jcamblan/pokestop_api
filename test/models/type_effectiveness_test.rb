# frozen_string_literal: true

# == Schema Information
#
# Table name: type_effectivenesses
#
#  id                :bigint           not null, primary key
#  attacking_type_id :integer
#  defending_type_id :integer
#  effectiveness     :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class TypeEffectivenessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
