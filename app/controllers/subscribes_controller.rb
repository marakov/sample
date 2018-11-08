class SubscribesController < ApplicationController
  def new

  end

  def index
    @subscribes = Subscribe.paginate(page: params[:page])
  end
end
