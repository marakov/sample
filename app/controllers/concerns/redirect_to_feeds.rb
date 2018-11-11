module RedirectToFeeds
  extend ActiveSupport::Concern

  included do
    before_action :redirect_to_feeds, only: [:home]
  end

  def redirect_to_feeds
    if signed_in?
      store_location
      redirect_to feeds_path
    end
  end
end