class CreateInfoAcademicas < ActiveRecord::Migration
  def change
    create_table :info_academicas do |t|
      t.integer :nivel
      t.string :curso
      t.boolean :incompleto
      t.string :instituicao
      t.date :inicio
      t.date :fim
      t.belongs_to :cv

      t.timestamps
    end
  end
end
