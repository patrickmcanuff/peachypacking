class ProjectsController < ApplicationController
  def home
    if current_user.projects.empty?
      @project = create_first_project
    else
      @project = current_user.projects.last
    end
    @box = Box.where(user:current_user)
    @item = Item.where(user:current_user)
  end

  def scan


  end

  def index
    @projects = current_user.projects
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
    Project.create(name: "First project created", user: current_user)
  end

end

