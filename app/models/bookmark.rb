class Bookmark < ActiveRecord::Base
  attr_accessible :link, :tag, :title, :username

  validates :link,      presence: true, length: { maximum: 50 }
  validates :title,     presence: true, length: { maximum: 50 }
  validates :tag,       presence: true, length: { maximum: 50 }
  validates :username,  presence: true, length: { maximum: 50 }
end
