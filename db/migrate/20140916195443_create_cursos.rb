class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :descricao
      t.string :instituicao
      t.date :inicio
      t.date :fim

      t.timestamps
    end
  end
end
