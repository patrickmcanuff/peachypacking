class BoxesController < ApplicationController
  def edit

  end

  def destroy

  end

  def index
    @boxes = Box.all
  end

  def new
    @project = Project.find(params[:project_id])
    @box = Box.new
  end

  def create
    @box = Box.new(box_params)
    project = params[:project_id]
    @box.project_id = project
    @box.save
  end

  def box_params
    params.require(:box).permit(:name, :comment, :size,)
  end
end
