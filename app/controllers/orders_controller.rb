class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new
  end

  def create
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
      @orderform.save(params, current_user.id)
      redirect_to '/'
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:post, :prefecture_id, :municipality, :construction, :address, :phone).merge(
      item_id: params[:item_id], user_id: current_user.id
    )
  end
end
