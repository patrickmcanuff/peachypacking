class ItemsController < ApplicationController
  def edit
    @item = Item.find(params[:id])
    @box = Box.find_by(project_id: @item.project_id)
  end

  def update
    item = Item.find(params[:id])
    project_id = item.project
    item.update(item_params)
    redirect_to project_items_path(project_id)
  end

  def destroy
    item = Item.find(params[:id])
    project_id = item.project
    item.destroy
    redirect_to project_items_path(project_id)
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
    if @item.save
      redirect_to project_items_path(project)
    else
      render :new
    end
  end

  def index
    @items = Item.where(project_id: params[:project_id], box_id: nil)
  end

  def item_params
    params.require(:item).permit(:name, :comment, :box_id, :packing_date)
  end
end
