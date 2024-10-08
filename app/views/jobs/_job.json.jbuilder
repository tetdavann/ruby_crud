json.extract! job, :id, :title, :description, :category_id, :is_completed, :created_at, :updated_at
json.url job_url(job, format: :json)
