class CreateCrudMunicipios < ActiveRecord::Migration
  def change
    create_table :crud_municipios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
