class ShopsController < ApplicationController

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to @shop
    else
      render"edit"
    end
  end

  def show
  end

  private

  def shop_params
    params.require(:shop).permit(:address,:phone_number,:station,:parking_id,:year,:month,:day,:url)
  end

end

