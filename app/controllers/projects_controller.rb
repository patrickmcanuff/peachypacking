class ProjectsController < ApplicationController

  def index
    if current_user.projects.empty?
      @project = create_first_project
    else
      @project = current_user.projects.last
    end
  end

  def show
    @project = Project.find(params[:id])
    @boxes = Box.where(user:current_user)
    @items = Item.where(user:current_user)
  end

  def scan
  end

  def new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def create_first_project
    Project.create(name: "Your first", user: current_user)
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

  def search
    # write a search for boxes and store in instance variable
    @boxes = Box.search(params[:query], where: {project_id: params[:project][:id]})
    # write a search for items and store in instance variable
    @items = Item.search(params[:query], where: {project_id: params[:project][:id]})
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end

