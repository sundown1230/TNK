# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# サンプルプロジェクトを挿入
require 'date'
Project.create(title: 'プロジェクト1', project_manager_id: 1, starts_at: Date.today.to_s(:db), ends_at: Date.today.to_s(:db), description: "サンプルプロジェクト1", status: 0, created_at: DateTime.now.to_s(:db), updated_at:DateTime.now.to_s(:db))
Project.create(title: 'プロジェクト2', project_manager_id: 2, starts_at: Date.today.to_s(:db), ends_at: Date.today.to_s(:db), description: "サンプルプロジェクト2", status: 0, created_at: DateTime.now.to_s(:db), updated_at:DateTime.now.to_s(:db))
Project.create(title: 'プロジェクト3', project_manager_id: 3, starts_at: Date.today.to_s(:db), ends_at: Date.today.to_s(:db), description: "サンプルプロジェクト3", status: 1, created_at: DateTime.now.to_s(:db), updated_at:DateTime.now.to_s(:db))
Project.create(title: 'プロジェクト4', project_manager_id: 4, starts_at: Date.today.to_s(:db), ends_at: Date.today.to_s(:db), description: "サンプルプロジェクト4", status: 1, created_at: DateTime.now.to_s(:db), updated_at:DateTime.now.to_s(:db))
Project.create(title: 'プロジェクト5', project_manager_id: 5, starts_at: Date.today.to_s(:db), ends_at: Date.today.to_s(:db), description: "サンプルプロジェクト5", status: 2, created_at: DateTime.now.to_s(:db), updated_at:DateTime.now.to_s(:db))


