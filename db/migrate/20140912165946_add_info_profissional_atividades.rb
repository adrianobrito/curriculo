class AddInfoProfissionalAtividades < ActiveRecord::Migration
  def change

  	change_table :atividades do |t|
      t.belongs_to :info_profissionais
    end

  end
end
