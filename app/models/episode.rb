class Episode < ApplicationRecord
  include ImageUploader[:image]
  include AudioUploader[:audio]

  scope :published, -> { where.not(published_at: nil) }
  scope :published_order, -> { order(published_at: :desc) }

  validates :slug, :header, :text, presence: true
  validates :slug, uniqueness: true

  def to_param
    slug
  end
end
