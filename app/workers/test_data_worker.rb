class RssWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    puts "start load feed via rss!"
    channels = Channel.all
    channels.entries.each do |channel|
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
    puts "success!"
  end
end