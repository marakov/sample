namespace :rss do
  desc "Fill database with rss feeds"
  task fetch: :environment do
    RssWorker.perform_async
  end
end