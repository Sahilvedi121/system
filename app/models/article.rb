class Article < ApplicationRecord
    has_one_attached :image
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  # validates :image, presence: true, blob: { body_type: :image, size_range: 1..5.megabytes }

end
