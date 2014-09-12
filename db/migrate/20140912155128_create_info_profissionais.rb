class CreateInfoProfissionais < ActiveRecord::Migration
  def change
    create_table :info_profissionais do |t|
      t.date :inicio
      t.date :fim
      t.string :instituicao
      t.string :cargo

      t.timestamps
    end
  end
end
