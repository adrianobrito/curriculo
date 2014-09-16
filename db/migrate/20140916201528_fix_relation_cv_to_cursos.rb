class FixRelationCvToCursos < ActiveRecord::Migration
  def change
  	remove_column :cursos, :cvs_id
  	change_table :cursos do |t|
      t.belongs_to :cv
    end
  end
end
