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


  def create
    @channel = Channel.new(channel_params)
    if addChannel?
      respond_to do |format|
        if @channel.save
          @channels = Channel.all
          format.html
          format.js {render :action => "update_channels"}
        else
          format.html
          format.js {render :action => "cantAddChannel"}
        end
      end
    else
      if checkRssLinkAction?
        @rssCheck = @channel.checkRssLink?
        respond_to do |format|
          format.js {render :action => "rssCheck"}
        end
      end
    end
  end

  def channel_params
    params.require(:channel).permit(:name, :url, :description, :category_id, :type_id)
  end

  def checkRssLinkAction?
    params[:commit] == "Проверить ссылку"
  end

  def addChannel?
    params[:commit] == "Добавить"
  end
end