class ItemsController < ApplicationController
  def edit
  end

  def destroy
  end

  def new
    @project = Project.find(params[:project_id])
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    project = Project.find(params[:project_id])
    @item.project = project
    unless params[:item][:box_id].empty?
      @item.box = Box.find(params[:item][:box_id])
    end
    @item.save!
    # if @item.save
    #   redirect_to home_path(project)
    # else
    #   render :new
    # end
  end

  def item_params
    params.require(:item).permit(:name, :comment, :box, :packing_date)
  end

  def create
  end
end
