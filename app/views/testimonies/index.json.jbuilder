json.array!(@testimonies) do |testimony|
  json.extract! testimony, :id
  json.url testimony_url(testimony, format: :json)
end
