class FixInfoProfissionalAtividades < ActiveRecord::Migration
  def change
  	remove_column :atividades, :info_profissionais_id
  	change_table :atividades do |t|
      t.belongs_to :info_profissional
    end
  end
end
