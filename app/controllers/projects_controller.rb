class ProjectsController < ApplicationController
  def home
    raise
    if current_user.projects.empty?
      @project = create_first_project
    else
      @project = current_user.projects.last
    end
  end

  def scan
  end

  def create_first_project
    Project.create(name: "project almost done", user: current_user)
  end

end

