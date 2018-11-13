module SignedInUser
  extend ActiveSupport::Concern

  included do
    before_action :redirect_to_sign_in, only: [:index, :edit, :update, :show]
  end

# Before actions

  def redirect_to_sign_in
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Пожалуйста, залогиньтесь"
    end
  end
end