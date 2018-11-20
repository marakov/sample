class RssWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    puts "success!"
  end
end