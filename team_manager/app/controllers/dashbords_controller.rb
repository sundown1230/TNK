class DashbordsController < ApplicationController
  def home
	tasks = Task.all
	gon.tasks = []
	task_num = tasks.length
	for i in 0..task_num-1 do
	  task = {"title"=> tasks[i].title,
	          "due"=> tasks[i].due,
			  "url"=> project_task_path(tasks[i].project_id, tasks[i].id)
			 }
	  gon.tasks.push(task)  
    end
  end
end
