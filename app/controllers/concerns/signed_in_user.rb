module SignedInUser
  extend ActiveSupport::Concern

  included do
    before_action :signed_in_user, only: [:index, :edit, :update]
  end

# Before filters

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
end