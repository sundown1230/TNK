class ProjectsController < ApplicationController
  def new
  end

  def create
    render plain: params[:project].inspect
  end

  def index
  end

  def show
  end

  def list
  end
end
