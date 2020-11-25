class BoxesController < ApplicationController

  def edit

  end

  def destroy

  end

    def autocomplete
    render json: Project.search(params[:query], {
      fields: ["name"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:name)
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
    if @box.save
      redirect_to project_boxes_path(project)
    else
      render :index
    end
  end

  def box_params
    params.require(:box).permit(:name, :comment, :size,)
  end

end
