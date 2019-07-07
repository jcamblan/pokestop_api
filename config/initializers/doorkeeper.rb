# frozen_string_literal: true

Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (needs plugins)
  orm :active_record

  resource_owner_from_credentials do
    User.authenticate(params[:username], params[:password])
  end

  admin_authenticator do
    if current_user
      head :forbidden unless current_user.admin?
    else
      redirect_to sign_in_url
    end
  end

  api_only

  access_token_expires_in 2.hours

  use_refresh_token

  enforce_configured_scopes

  grant_flows %w[password]
end
