class TagsController < ApplicationController
  def edit
    @tag = Tag.find(params[:id])
    # @box = Box.find_by(project_id: @item.project_id)
  end

  def destroy
    tag = Box.find(params[:id])
    tag.destroy
    # redirect_to tag_path
  end

  def new
    @item = Item.find(params[:project_id])
    @box = Box.find(params[:project_id])
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to @tag
    else
      render :new
    end
  end
  end

  def add_tag_to_item

  end

  def add_tag_to_box

  end

  private

  def item_params
    params.require(:tag).permit(:name, :item_id, :box_id)
  end
end
