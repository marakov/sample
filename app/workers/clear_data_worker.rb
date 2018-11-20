class ClearDataWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(feeds, channels, users)
    puts "ClearDataWorker: start clear data!"
    if feeds
      clearFeeds
    end
    if channels
      clearChannels
    end
    if users
      clearUsers
    end
    puts "ClearDataWorker: success!"
  end

  def clearUsers
    puts "ClearDataWorker: clearUsers"
    User.destroy_all
    puts "done"
  end

  def clearChannels
    puts "ClearDataWorker: clearChannels"
    Channel.destroy_all
    puts "done"
  end

  def clearFeeds
    puts "ClearDataWorker: clearFeeds"
    Feed.destroy_all
    puts "done"
  end

end
