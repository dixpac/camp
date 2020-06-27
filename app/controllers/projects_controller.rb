class ProjectsController < ApplicationController
  def index
    @projects = Current.account.projects.all
  end

  def show
    @project = Current.account.projects.find params[:id]
  end
end
