class FeedsController < ApplicationController
  include SignedInUser

  def index
    @feeds = get_feeds
  end

  def get_feeds
    @current_user = current_user
    @feeds = Array[]
    @current_user.channels.entries.each_with_index  do |channel, index|
      @feeds[index] = Feedjira::Feed.fetch_and_parse channel.url
    end
    @feeds
  end
end
