class ChannelsController < ApplicationController
  def index
    # @subscribes = Subscribe.where("user_id = " + current_user.id.to_s)
    # ids = @subscribes.collect(&:channel_id).join(', ')
    # @channels = Channel.where("id in (" + ids + ")")
    @channels = Channel.all
  end
end
