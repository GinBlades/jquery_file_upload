json.array!(@uploads) do |upload|
  json.extract! upload, :id, :thing
  json.url upload_url(upload, format: :json)
end
