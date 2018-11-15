class ChannelsController < ApplicationController
  include SignedInUser
  skip_before_action :verify_authenticity_token

  def index
    @channels = Channel.all
    @newChannel = Channel.new
    @categories = Category.all
  end

  def show
    @channel = Channel.find(params[:id])
    @feeds = Feedjira::Feed.fetch_and_parse @channel.url
  end

  def search
    s = "select * from channels where name LIKE '%" + params[:channel][:name] + "%' and url LIKE '%" + params[:channel][:uri] + "%'"
    @channels = Channel.find_by_sql(s)
    respond_to do |format|
      format.html
      format.js {render :action => "update_channels"}
    end
  end

end