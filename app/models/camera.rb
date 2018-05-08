class Camera < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  has_many :line_items

  validates :title, :brand, :price, :model, :condition, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed" } 
  validates :price, length: { maximum: 7 }

  BRAND = %w{ Nikon Canon Sony Pentax Fujifilm Olympus Panasonic Leica GoPro }
  COLOR = %w{ Black Grey White Silver Red Blue Green Yellow }
  CONDITION = %w{ New Excellent Mint Used Fair Poor }

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end

end
