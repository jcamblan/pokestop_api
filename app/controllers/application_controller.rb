# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Clearance::Controller
  before_action :doorkeeper_authorize!
end
