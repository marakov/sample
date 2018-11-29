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
    s = "select * from feeds where channel_id = " + @channel.id.to_s
    @feeds = Feed.where(channel_id: @channel.id).paginate(page: params[:page], per_page: 10).order('created_at Desc')
    @fromRss = false
    if (@feeds == nil or @feeds.entries.size == 0)
      @feeds = Feedjira::Feed.fetch_and_parse @channel.url
      @fromRss = true
    end
  end

  def edit
    @channel = Channel.find(params[:id])
    @categories = Category.all
  end

  def search
    s = "select * from channels where LOWER(name) LIKE LOWER('%" + params[:channel][:name] +
        "%') and LOWER(url) LIKE LOWER('%" + params[:channel][:uri] + "%')"
    @channels = Channel.find_by_sql(s)
    respond_to do |format|
      format.html
      format.js {render :action => "update_channels"}
    end
  end

  def update
    @channel = Channel.find(params[:id])

    if @channel.update(channel_params)
      ChannelUpdateWorker.perform_async @channel.id
      redirect_to @channel
    else
      @categories = Category.all
      render 'edit'
    end
  end

  def create
    @channel = Channel.new(channel_params)
    if addChannel?
      respond_to do |format|
        if @channel.save
          @channels = Channel.all
          RssWorker.perform_async
          format.html
          format.js {render :action => "afterChannelCreation"}
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


  private

  def channel_params
    params.require(:channel).permit(:name, :url, :description, :category_id, :type_id, :user_id, :site_page)
  end

  def checkRssLinkAction?
    params[:commit] == "Проверить ссылку"
  end

  def addChannel?
    params[:commit] == "Добавить"
  end
end