# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sample_user_num = 5
sample_pm_num = 2
sample_report_num = 3
sample_task_num = 3
sample_project_num = 3

require 'date'
# サンプルユーザーは手動で作ってください。
# paperclipやらdeviseやらいろいろ絡んでて面倒なので（特に暗号化されたパスワード）


# サンプルユーザーの作成
for user_i in 1..sample_user_num do
  user = User.new(email: "user#{user_i}@gmail.com", name: "user#{user_i}", generation: 0, password: "password", description: "test user#{user_i}")
  user.save
end

# サンプルプロジェクトを挿入
for pm_i in 1..User.all.length do
  for project_i in 1..sample_project_num do
    project_index = (pm_i-1)*sample_project_num + project_i
    project = Project.create(title: "プロジェクト#{project_index}", project_manager_id: pm_i, starts_at: Date.today.to_s(:db), ends_at: Date.today.to_s(:db), description: "サンプルプロジェクト", status: 0)
  end
end

# サンプルプロジェクトレポートを挿入
for project_i in 1..sample_project_num do
  for report_i in 1..sample_report_num do
    project = Project.find(project_i)
	project.reports.create(project_id: project_i, title: "レポート#{report_i}", text: "サンプルプロジェクトレポート")
  end
end

# サンプルタスクを挿入
for project_i in 1..sample_project_num do
  for task_i in 1..sample_task_num do
    project = Project.find(project_i)
	due = (DateTime.now + ((project_i-1)*sample_task_num + task_i).days).to_s(:db)
	project.tasks.create(project_id: project_i, title: "タスク#{task_i}", content: "サンプルタスク", due: due)
  end
end

# リレーション情報の挿入
# プロジェクト
for user_i in 1..User.all.length do
  for project_i in 1..Peoject.all.length do 
    project = Project.find(project_i)
    project.projects_users.create(project_id: project_i, user_id: user_i)
  end
end

#レポート
for user_i in 1..User.all.length do
  for report_i in 1..Report.all.length do 
    report = Report.find(report_i)
    report.reports_users.create(report_id: report_i, user_id: user_i)
  end
end

#タスク
for user_i in 1..User.all.length do
  for task_i in 1..Task.all.length do 
    task = Task.find(task_i)
    task.tasks_users.create(task_id: task_i, user_id: user_i)
  end
end
