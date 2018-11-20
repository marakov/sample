namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    TestData.perform_async
  end
end