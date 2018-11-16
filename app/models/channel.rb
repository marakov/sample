class Channel < ApplicationRecord
  belongs_to :type;
  belongs_to :category
  has_many :subscribes, :dependent => :destroy
  has_many :users, through: :subscribes, source: :user

  validates :name, presence: true, uniqueness: {case_sensitive: true}
  validates :url, presence: true, uniqueness: {case_sensitive: true}
  validate :isRssLinkValid?

  def has_sub(user)
    user.channels.include? self
  end

  def getSubCount
    return self.subscribes.size
  end

  def checkRssLink?
    begin
      @feeds = Feedjira::Feed.fetch_and_parse url
      if @feeds.entries.size > 0
        return true
      else
        return false
      end
    rescue => e
      return false
    end
  end

  private

  def isRssLinkValid?
    errors.add(:url, "is not valid.") unless checkRssLink?
  end
end