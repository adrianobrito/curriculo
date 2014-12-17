class AddNascimentoToInfoPessoals < ActiveRecord::Migration
  def change
  	
  	change_table :info_pessoals do |t|
  		t.date :nascimento 
  	end

  end
end
