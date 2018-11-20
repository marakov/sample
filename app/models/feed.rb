class Feed < ApplicationRecord
  validates :url, presence: true, uniqueness: {case_sensitive: true}

  belongs_to :channel

  self.per_page = 10
end
