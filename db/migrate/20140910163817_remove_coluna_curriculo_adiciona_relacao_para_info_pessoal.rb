class RemoveColunaCurriculoAdicionaRelacaoParaInfoPessoal < ActiveRecord::Migration
  def change

  	remove_column :info_pessoals, :curriculo_id
  	change_table :info_pessoals do |t|
      t.belongs_to :cv
    end

  end
end
