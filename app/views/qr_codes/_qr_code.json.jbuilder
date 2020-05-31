json.extract! qr_code, :id, :user_id, :title, :url, :created_at, :updated_at
json.url qr_code_url(qr_code, format: :json)
