module ApplicationHelper

  def cart_count_over_one
    if @cart.line_items.count > 0
      return "<span class='tag is-dark'>#{@cart.line_items.count}</span>".html_safe
    end
  end

  def cart_has_items
    unless @cart.nil?
      return @cart.line_items.count > 0
    end
  end

  # def is_in_cart
  #   unless cart_has_items
  #     return @cart.line_items.include(params[:id])
  #   end
  # end
end
