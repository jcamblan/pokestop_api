# frozen_string_literal: true

# == Schema Information
#
# Table name: xps
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Xp < ApplicationRecord
  translates :name, touch: true
end
