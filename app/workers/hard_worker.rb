class HardWorker
  include Sidekiq::Worker
  def perform(name, count)
    puts name
    puts count
    # do something
  end
end