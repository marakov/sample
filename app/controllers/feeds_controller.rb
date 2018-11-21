class FeedsController < ApplicationController
  include SignedInUser

  def index
    @current_user = current_user
    ids = @current_user.channels.entries.map(&:id)
    @feeds = getRecentFeeds ids
    @topFeeds = getTopFeeds ids
    respond_to do |format|
      format.html
      format.js
    end
  end

  def getRecentFeeds(ids)
    Feed.where(channel_id: ids).paginate(page: params[:page], per_page: 5).order('created_at Desc')
  end

  def getTopFeeds(ids)
    Feed.where(channel_id: ids).order(:cached_votes_total=> :desc).limit(5)
  end

  def vote
    @feed = Feed.find(params[:id])
    if !current_user.liked? @feed
      @feed.liked_by current_user
    elsif current_user.liked? @feed
      @feed.unliked_by current_user
    end
  end
end
