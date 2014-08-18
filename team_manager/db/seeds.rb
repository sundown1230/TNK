# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'date'
# サンプルユーザーは手動で作ってください。
# paperclipやらdeviseやらいろいろ絡んでて面倒なので（特に暗号化されたパスワード）

# サンプルプロジェクトを挿入
Project.create(title: 'プロジェクト1', project_manager_id: 1, starts_at: Date.today.to_s(:db), ends_at: Date.today.to_s(:db), description: "サンプルプロジェクト1", status: 0, created_at: DateTime.now.to_s(:db), updated_at:DateTime.now.to_s(:db))
Project.create(title: 'プロジェクト2', project_manager_id: 2, starts_at: Date.today.to_s(:db), ends_at: Date.today.to_s(:db), description: "サンプルプロジェクト2", status: 0, created_at: DateTime.now.to_s(:db), updated_at:DateTime.now.to_s(:db))
Project.create(title: 'プロジェクト3', project_manager_id: 3, starts_at: Date.today.to_s(:db), ends_at: Date.today.to_s(:db), description: "サンプルプロジェクト3", status: 1, created_at: DateTime.now.to_s(:db), updated_at:DateTime.now.to_s(:db))
Project.create(title: 'プロジェクト4', project_manager_id: 4, starts_at: Date.today.to_s(:db), ends_at: Date.today.to_s(:db), description: "サンプルプロジェクト4", status: 1, created_at: DateTime.now.to_s(:db), updated_at:DateTime.now.to_s(:db))
Project.create(title: 'プロジェクト5', project_manager_id: 5, starts_at: Date.today.to_s(:db), ends_at: Date.today.to_s(:db), description: "サンプルプロジェクト5", status: 2, created_at: DateTime.now.to_s(:db), updated_at:DateTime.now.to_s(:db))


# サンプルプロジェクトレポートを挿入
Report.create(project_id: 1, user_id: 1, title: "レポート1", text: "サンプルプロジェクトレポート1", created_at: DateTime.now.to_s(:db), updated_at:DateTime.now.to_s(:db))
Report.create(project_id: 1, user_id: 2, title: "レポート2", text: "サンプルプロジェクトレポート2", created_at: DateTime.now.to_s(:db), updated_at:DateTime.now.to_s(:db))
Report.create(project_id: 1, user_id: 3, title: "レポート3", text: "サンプルプロジェクトレポート3", created_at: DateTime.now.to_s(:db), updated_at:DateTime.now.to_s(:db))

# サンプル資料を挿入
