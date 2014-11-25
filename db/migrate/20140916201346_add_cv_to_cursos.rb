class AddCvToCursos < ActiveRecord::Migration
  def change
  	change_table :cursos do |t|
      t.belongs_to :cvs
    end
  end
end
