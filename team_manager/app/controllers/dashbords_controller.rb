class DashbordsController < ApplicationController
  def home
    @tasks = Task.all
    gon.tasks = @tasks
  end
end
