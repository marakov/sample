module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Новостник"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end


  def show_svg(path)
    File.open("app/assets/images/#{path}", "rb") do |file|
      raw file.read
    end
  end

  def convertDate(date)
    DateFormat.change_to(date, "ONLY_DATE")
  end

  def getFeedUrl(feed_url, site_page)
    if (feed_url.include? "http")
      return feed_url
    elsif site_page != nil
      return site_page + feed_url
    else
      return "#"
    end
  end
end
