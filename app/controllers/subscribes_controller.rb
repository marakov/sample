class SubscribesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new

  end

  def index
    @subscribes = Subscribe.paginate(page: params[:page])
  end

  def create
    @subscribe = Subscribe.new(subscribe_params)
    @subscribe.save
  end

  def destroy
    @subscribe = Subscribe.new(subscribe_params)
    @subscribe.destroy
  end

  def subscribe_params
    params.require(:subscribe).permit(:user_id, :channel_id)
  end
end
