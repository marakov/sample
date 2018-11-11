class SubscribesController < ApplicationController
  def new

  end

  def index
    @subscribes = Subscribe.paginate(page: params[:page])
  end

  def create
    @subscribe = Subscribe.new(params[:subscribe])
    @subscribe.save
    respond_to do |format|
      format.html {render nothing: true}
    end
  end

  def subscribe_params
    params.require(:subscribe).permit(:user_id, :channel_id)
  end
end
