class Channel < ApplicationRecord
  has_one :type;
  has_one :category;
  has_many :subscribes, :dependent => :destroy
  has_many :users, through: :subscribes, source: :user

  validates :name, presence: true
  validates :url, presence: true, uniqueness: {case_sensitive: true}

  def has_sub(user)
    user.channels.include? self
  end

  # def getSubscribeText(user)
  #   return "Subscribed" if has_sub user
  #   return "Subscribe"
  # end
  #
  # def getSubbedClass(user)
  #   return "subbed" if has_sub user
  # end

  def getSubCount
    return self.subscribes.size
  end
end