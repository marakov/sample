class Channel < ApplicationRecord
  has_one :type;
  has_one :category;
  has_many :subscribes, :dependent => :destroy
  has_many :users, through: :subscribes, source: :user

  validates :name, presence: true
  validates :url, presence: true, uniqueness: {case_sensitive: true}
end