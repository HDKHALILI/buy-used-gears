class LineItem < ApplicationRecord
  belongs_to :camera
  belongs_to :cart

  def total_price
    camera.price.to_i * quantity.to_i
  end
end
