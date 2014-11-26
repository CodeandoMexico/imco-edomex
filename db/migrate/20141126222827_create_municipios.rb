class CreateMunicipios < ActiveRecord::Migration
  def change
    create_table :municipios do |t|

      t.timestamps
    end
  end
end
