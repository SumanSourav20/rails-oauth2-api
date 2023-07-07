json.extract! upload, :id, :content, :created_at, :updated_at
json.url upload_url(upload, format: :json)
