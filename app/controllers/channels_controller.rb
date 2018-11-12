class ChannelsController < ApplicationController
  include SignedInUser

  def index
    @channels = Channel.all
  end
end
