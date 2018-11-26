class ChannelUpdateWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(channelId)
    puts "RssWorker: start load feed via rss!"
    fetchFeedsForChannel Channel.find(channelId)
    puts "RssWorker: success!"
  end

  def fetchFeedsForChannel(channel)
    puts channel.name
    feeds = Feedjira::Feed.fetch_and_parse channel.url
    puts "news loaded:"
    puts feeds.entries.size
    feeds.entries.each do |feed|
      Feed.create(title: feed.title,
                  url: feed.url,
                  channel_id: channel.id,
                  summary: feed.summary,
                  created_at: feed.published)
    end
  end
end