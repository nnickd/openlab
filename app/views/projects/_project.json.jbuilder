json.extract! project, :id, :user_id, :title, :about, :context, :significance, :goals, :created_at, :updated_at
json.url project_url(project, format: :json)