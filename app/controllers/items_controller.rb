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
    project = params[:project_id]
    @item.project_id = project
    if @item.save
      redirect_to new_project_item_path(project)
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:name, :comment, :box_id)
  end
end
