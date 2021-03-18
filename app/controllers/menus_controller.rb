class MenusController < ApplicationController

  def new
    @menu = Menu.new
  end

  def create  
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to @menu
    else
      render "new"
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to @menu
    else
      render"edit"
    end
  end

  def show
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
  end
  
  private

  def menu_params
    params.require(:menu).permit(:name,:price,:image).merge(user_id:current_user.id)
  end

end
