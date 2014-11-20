class AddHorasAulaToCurso < ActiveRecord::Migration
  def change

  	change_table :cursos do |t|
  		t.integer :horas_aula 
  	end

  end
end
