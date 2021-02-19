class Tweet < ApplicationRecord

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true

  # association
  belongs_to :user
  has_many :comments
  has_one_attached :image

end
