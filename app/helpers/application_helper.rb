module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def get_feed
    # url = "http://feeds.bbci.co.uk/news/world/rss.xml?edition=uk#"
    fapl = "http://premiership.ru/rss.xml"
    feed = Feedjira::Feed.fetch_and_parse fapl
    feed
  end
end
