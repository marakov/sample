class ChannelsController < ApplicationController
  include SignedInUser

  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.find(params[:id])
    @feeds = Feedjira::Feed.fetch_and_parse @channel.url
  end
end
