class ClearOldFeedsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    puts "ClearOldFeedsWorker: start clear data!"
    clearFeeds
    puts "ClearOldFeedsWorker: success!"
  end

  def clearFeeds
    Feed.where('created_at < ?', 5.days.ago).each do |model|
      model.destroy
    end
  end

end
