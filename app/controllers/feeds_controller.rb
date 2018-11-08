class FeedsController < ApplicationController
  def index
    @feeds = get_feed
  end

  def get_feed
    # url = "http://feeds.bbci.co.uk/news/world/rss.xml?edition=uk#"
    fapl = "http://premiership.ru/rss.xml"
    feed = Feedjira::Feed.fetch_and_parse fapl
    feed
  end
end
