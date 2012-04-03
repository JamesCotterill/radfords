class LineItemsController < ApplicationController
  def create
    @basket = current_basket
    product = Product.find(params[:product_id])
    @line_item = @basket.line_items.build(product: product)
    @line_item.save
    flash[:success] = 'Line item was successfully created.'
    redirect_to(basket_path(@line_item.basket.id))
  end
end