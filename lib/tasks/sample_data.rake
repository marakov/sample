namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n + 1}@railstutorial.org"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end

require 'feedjira'

namespace :rss do
  desc "Fetch rss feed"
  task :fetch => :environment do
    channels = Channel.all
    channels.entries.each do |channel|
      feeds = Feedjira::Feed.fetch_and_parse channel.url
      feeds.entries.each do |feed|
        Feed.create(title: feed.title,
                    url: feed.url,
                    channel_id: channel.id,
                    summary: feed.summary,
                    created_at: feed.published)
      end
    end

  end
end