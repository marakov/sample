class SubscribesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new

  end

  def index
    @subscribes = Subscribe.paginate(page: params[:page])
  end

  def create
    @subscribe = Subscribe.new(subscribe_params)
    if @subscribe.save
      respond_to do |format|
        @channels = Channel.all
        @channel = Channel.find_by(params[:channel_id])
        @user = User.find_by(params[:user_id])
        format.html
        format.js {render :action => "sub_form"}
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    # Subscribe.find_by(params[:user_id], params[:channel_id]).destroy!
    Subscribe.find(params[:id]).destroy!
    respond_to do |format|
      @channels = Channel.all
      @channel = Channel.find_by(params[:channel_id])
      @user = User.find_by(params[:user_id])
      format.html
      format.js {render :action => "sub_form"}
    end
  end

  def subscribe_params
    params.require(:subscribe).permit(:user_id, :channel_id)
  end
end
