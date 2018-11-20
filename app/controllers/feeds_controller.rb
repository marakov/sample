class FeedsController < ApplicationController
  include SignedInUser

  def index
    @current_user = current_user
    ids = @current_user.channels.entries.map(&:id)
    @feeds = Feed.where(channel_id: ids).paginate(page: params[:page], per_page: 5).order('created_at Desc')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def get_feeds_old
    @current_user = current_user
    @feeds = Array[]
    @current_user.channels.entries.each_with_index do |channel, index|
      @feeds[index] = Feedjira::Feed.fetch_and_parse channel.url
    end
    @feeds
  end
end
