json.array!(@crud_tramites) do |crud_tramite|
  json.extract! crud_tramite, :id, :nombre, :giro, :local_determinado, :remodelacion
  json.url crud_tramite_url(crud_tramite, format: :json)
end
