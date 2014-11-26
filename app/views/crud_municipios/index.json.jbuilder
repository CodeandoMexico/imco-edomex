json.array!(@crud_municipios) do |crud_municipio|
  json.extract! crud_municipio, :id, :nombre
  json.url crud_municipio_url(crud_municipio, format: :json)
end
