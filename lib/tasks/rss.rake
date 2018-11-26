namespace :rss do
  desc "Fill database with rss feeds"
  task fetch: :environment do
    RssWorker.perform_async Channel.all
  end
  desc "Clear feeds that older than 7 days"
  task clear: :environment do
    ClearOldFeedsWorker.perform_async
  end
end