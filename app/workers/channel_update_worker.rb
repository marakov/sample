class ChannelUpdateWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(channel)
    puts "RssWorker: start load feed via rss!"
    fetchFeedsForChannel channel
    puts "RssWorker: success!"
  end
end