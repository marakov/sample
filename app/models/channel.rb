class Channel < ApplicationRecord
  belongs_to :type;
  belongs_to :category
  has_many :subscribes, :dependent => :destroy
  has_many :users, through: :subscribes, source: :user

  validates :name, presence: true
  validates :url, presence: true, uniqueness: {case_sensitive: true}

  def has_sub(user)
    user.channels.include? self
  end

  def getSubCount
    return self.subscribes.size
  end
end