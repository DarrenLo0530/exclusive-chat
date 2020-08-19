class Post < ApplicationRecord
  belongs_to :member
  validates :body, presence: true
end
