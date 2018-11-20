namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    TestData.perform_async
  end
  desc "Clearing feeds"
  task clearFeeds: :environment do
    ClearDataWorker.perform_async(true, false, false)
  end
  desc "Clearing channels"
  task clearChannels: :environment do
    ClearDataWorker.perform_async(false, true, false)
  end
  desc "Clearing users"
  task clearUsers: :environment do
    ClearDataWorker.perform_async(false, false, true)
  end
  desc "Clearing all"
  task clearAll: :environment do
    ClearDataWorker.perform_async(true, true, true)
  end
end