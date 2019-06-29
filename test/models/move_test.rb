# frozen_string_literal: true

# == Schema Information
#
# Table name: moves
#
#  id          :bigint           not null, primary key
#  kind        :string
#  type_id     :integer
#  power       :decimal(, )
#  epu         :decimal(, )
#  cast_time   :decimal(, )
#  energy_bars :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class MoveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
