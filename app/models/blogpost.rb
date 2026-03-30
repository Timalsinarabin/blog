class Blogpost < ApplicationRecord
  validates :blogtitle, presence: true
  belongs_to :user
end
