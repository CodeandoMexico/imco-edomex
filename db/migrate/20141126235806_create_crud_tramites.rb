class CreateCrudTramites < ActiveRecord::Migration
  def change
    create_table :crud_tramites do |t|
      t.string :nombre
      t.string :giro
      t.string :local_determinado
      t.string :remodelacion

      t.timestamps
    end
  end
end
