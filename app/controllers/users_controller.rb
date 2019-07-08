# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :doorkeeper_authorize!, only: :create
  before_action :set_user, only: %i[show followees followers]
  before_action :authorize_user, only: %i[show followees followers]

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user)
          .permit(
            :username,
            :email,
            :password,
            :gender,
            :terms_accepted_at,
            :term_version,
            :country_id,
            picture_attributes: [:image_id],
            category_ids: []
          )
  end
end
