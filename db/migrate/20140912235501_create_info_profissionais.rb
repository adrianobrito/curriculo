class CreateInfoProfissionais < ActiveRecord::Migration
  def change
    create_table :info_profissionais do |t|
      t.date :inicio
      t.date :fim
      t.string :empresa
      t.string :cargo
      t.belongs_to :cv

      t.timestamps
    end
  end
end
